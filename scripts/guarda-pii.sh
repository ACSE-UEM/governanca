#!/bin/sh
# guarda-pii.sh — recusa a entrada de dado pessoal no repositório.
#
# Uso:
#   ./guarda-pii.sh                 verifica os arquivos em stage (uso no pre-commit)
#   ./guarda-pii.sh --tudo          verifica todos os arquivos versionados (uso na CI)
#   ./guarda-pii.sh <arquivo>...    verifica arquivos específicos
#
# Saída: 0 se limpo, 1 se encontrou algo. A mensagem diz o arquivo e o motivo.
#
# A guarda prefere um falso positivo, que custa uma linha em .guarda-pii-ignore, a um
# vazamento, que é irreversível em repositório público. Ver governanca/SECURITY.md.

set -eu

# ---------------------------------------------------------------------------
# Configuração
# ---------------------------------------------------------------------------

# Colunas de cabeçalho proibidas em arquivo tabular. Este é o critério mais forte:
# um cabeçalho com estes nomes é dado pessoal por definição, não por heurística.
COLUNAS_PROIBIDAS='admin_email|admin_tel|admin_name|admin_nome|adm_email|adm_tel|adm_nome|cpf|rg|data_nascimento|nome_responsavel|telefone_responsavel|responsavel_email'

# Extensões tratadas como dado tabular ou estruturado.
EXT_DADOS='csv|tsv|xlsx|xls|ods|json|jsonl|ndjson|sql|db|sqlite|sqlite3|parquet'

# Extensões varridas por heurística de contato (texto legível por pessoa).
EXT_TEXTO='csv|tsv|json|jsonl|ndjson|sql|md|txt|html|htm|xml|yaml|yml|rst|org'

# Caminhos e nomes sempre ignorados: ruído conhecido, sem dado pessoal de titular.
# Arquivos de dependência trazem e-mail de mantenedor de biblioteca; SVG e mídia
# trazem sequências numéricas que se parecem com telefone.
IGNORAR_SEMPRE='(^|/)(vendor|node_modules|\.git|dist|build)/|\.(lock|svg|png|jpe?g|gif|ico|webp|pdf|woff2?|ttf|eot|otf|map|min\.js|min\.css|zip|gz|tar)$|(^|/)(composer|package|symfony|yarn|pnpm)-?lock(\.json)?$'

falhas=0

# ---------------------------------------------------------------------------
# Auxiliares
# ---------------------------------------------------------------------------

esta_ignorado() {
  # 1. ruído conhecido
  if printf '%s' "$1" | grep -qE "$IGNORAR_SEMPRE"; then
    return 0
  fi
  # 2. lista do repositório
  if [ -f .guarda-pii-ignore ]; then
    while IFS= read -r padrao; do
      case "$padrao" in ''|\#*) continue ;; esac
      case "$1" in $padrao) return 0 ;; esac
    done < .guarda-pii-ignore
  fi
  return 1
}

contar_emails() {
  grep -ohE '[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}' "$1" 2>/dev/null \
    | grep -viE '@(example|exemplo|teste|test|localhost|invalid|noreply|no-reply)\.' \
    | grep -viE '@(anthropic|github|gnu|w3|creativecommons)\.' \
    | sort -u | wc -l
}

contar_telefones() {
  # Exige DDD entre parênteses, ou DDD seguido do 9 do celular e hífen antes dos
  # quatro últimos dígitos. Sequências numéricas soltas (hashes, coordenadas,
  # códigos IBGE, datas) não casam.
  grep -ohE '(\([1-9][0-9]\)[ ]?9?[0-9]{4}[- ][0-9]{4})|(\b[1-9][0-9][ ]9[0-9]{4}-[0-9]{4}\b)' "$1" 2>/dev/null \
    | sort -u | wc -l
}

# ---------------------------------------------------------------------------
# Verificação de um arquivo
# ---------------------------------------------------------------------------

verificar_arquivo() {
  arquivo="$1"
  [ -f "$arquivo" ] || return 0
  esta_ignorado "$arquivo" && return 0

  ext_min="$(printf '%s' "${arquivo##*.}" | tr '[:upper:]' '[:lower:]')"

  # 1. Coluna proibida no cabeçalho de arquivo de dados. Critério definitivo.
  if printf '%s' "$ext_min" | grep -qE "^($EXT_DADOS)$"; then
    achadas="$(head -1 "$arquivo" 2>/dev/null | tr ',;\t"{}[]:' '\n\n\n\n\n\n\n\n\n' \
               | grep -oiE "^($COLUNAS_PROIBIDAS)$" | sort -u | tr '\n' ' ' || true)"
    if [ -n "$achadas" ]; then
      registros="$(( $(wc -l < "$arquivo") - 1 ))"
      printf 'ERRO  %s\n' "$arquivo"
      printf '      coluna de dado pessoal no cabeçalho: %s\n' "$achadas"
      printf '      cerca de %s registros afetados.\n' "$registros"
      printf '      Dado pessoal não entra em repositório: mova o arquivo para fora\n'
      printf '      (caminho em DADOS_DIR) e versione só o esquema e um exemplo fictício.\n'
      return 0
    fi
  fi

  # 2. Heurísticas de contato, apenas em arquivo de texto legível.
  printf '%s' "$ext_min" | grep -qE "^($EXT_TEXTO)$" || return 0

  emails="$(contar_emails "$arquivo")"
  if [ "${emails:-0}" -ge 5 ]; then
    printf 'ERRO  %s\n' "$arquivo"
    printf '      %s endereços de e-mail distintos — provável lista de contatos.\n' "$emails"
    return 0
  fi

  fones="$(contar_telefones "$arquivo")"
  if [ "${fones:-0}" -ge 5 ]; then
    printf 'ERRO  %s\n' "$arquivo"
    printf '      %s telefones distintos — provável lista de contatos.\n' "$fones"
    return 0
  fi

  if grep -qE '\b[0-9]{3}\.[0-9]{3}\.[0-9]{3}-[0-9]{2}\b' "$arquivo" 2>/dev/null; then
    printf 'ERRO  %s\n' "$arquivo"
    printf '      contém CPF.\n'
    return 0
  fi

  return 0
}

# ---------------------------------------------------------------------------
# Principal
# ---------------------------------------------------------------------------

case "${1:-}" in
  --tudo) lista="$(git ls-files)" ;;
  '')     lista="$(git diff --cached --name-only --diff-filter=ACMR)" ;;
  *)      lista="$(printf '%s\n' "$@")" ;;
esac

if [ -z "$lista" ]; then
  printf 'guarda-pii: nada a verificar.\n'
  exit 0
fi

saida="$(mktemp)"
trap 'rm -f "$saida"' EXIT INT TERM

printf '%s\n' "$lista" | while IFS= read -r f; do
  [ -n "$f" ] && verificar_arquivo "$f"
done > "$saida" 2>&1

falhas="$(grep -c '^ERRO' "$saida" || true)"

if [ "${falhas:-0}" -gt 0 ]; then
  cat "$saida" >&2
  printf '\nguarda-pii: %s arquivo(s) recusado(s).\n' "$falhas" >&2
  printf 'Se for falso positivo, acrescente o caminho a .guarda-pii-ignore com uma\n' >&2
  printf 'justificativa em comentário. Nunca ignore arquivo com dado real.\n' >&2
  exit 1
fi

printf 'guarda-pii: nenhum dado pessoal encontrado.\n'
exit 0
