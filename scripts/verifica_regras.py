#!/usr/bin/env python3
"""Verifica a consistência das regras federativas em docs/regras/.

Aplica as cinco verificações da convenção de regras (governanca/convencao-de-regras.md):

1. toda regra que declara `sobrepoe` aponta para um identificador existente;
2. regra estadual que sobrepõe um padrão BR tem o campo `sobrepoe` preenchido;
3. nenhum identificador é usado por dois arquivos;
4. nenhuma regra vigente está com `revisar_ate` vencido há mais de 90 dias;
5. nenhuma regra tenta sobrepor regra marcada como não sobreponível.

Sem dependências além da biblioteca padrão: o objetivo é rodar em qualquer
ambiente, inclusive na máquina de um voluntário sem preparo prévio.
"""

import datetime
import pathlib
import re
import sys

RAIZ = pathlib.Path("docs/regras")
TOLERANCIA_REVISAO = datetime.timedelta(days=90)


def ler_cabecalho(caminho):
    """Extrai o cabeçalho YAML simples do topo do arquivo."""
    texto = caminho.read_text(encoding="utf-8")
    m = re.match(r"^---\n(.*?)\n---\n", texto, re.S)
    if not m:
        return None
    dados = {}
    for linha in m.group(1).splitlines():
        if ":" not in linha or linha.strip().startswith("#"):
            continue
        chave, _, valor = linha.partition(":")
        valor = valor.split("#")[0].strip()
        if valor.lower() in ("null", "none", ""):
            valor = None
        dados[chave.strip()] = valor
    return dados


def main():
    if not RAIZ.is_dir():
        print("docs/regras/ não existe neste repositório — nada a verificar.")
        return 0

    arquivos = [p for p in RAIZ.rglob("*.md")
                if p.name not in ("LEIA-ME.md", "_modelo.md")]
    regras, erros = {}, []

    for caminho in sorted(arquivos):
        cab = ler_cabecalho(caminho)
        if cab is None:
            erros.append(f"{caminho}: sem cabeçalho YAML.")
            continue
        ident = cab.get("id")
        if not ident:
            erros.append(f"{caminho}: cabeçalho sem campo 'id'.")
            continue
        if ident in regras:
            erros.append(
                f"{caminho}: identificador '{ident}' já usado em {regras[ident]['arquivo']}. "
                "Identificador nunca é reutilizado."
            )
            continue
        cab["arquivo"] = caminho
        regras[ident] = cab

    hoje = datetime.date.today()

    for ident, r in sorted(regras.items()):
        arq, ambito = r["arquivo"], (r.get("ambito") or "")
        estado = (r.get("estado") or "").lower()
        sobrepoe = r.get("sobrepoe")

        if sobrepoe:
            if sobrepoe not in regras:
                erros.append(f"{arq}: sobrepõe '{sobrepoe}', que não existe.")
            elif (regras[sobrepoe].get("sobreponivel") or "sim").lower() == "nao":
                erros.append(
                    f"{arq}: sobrepõe '{sobrepoe}', que é NÃO SOBREPONÍVEL "
                    "(decorre diretamente da lei)."
                )
        elif ambito and ambito != "BR" and estado == "vigente":
            erros.append(
                f"{arq}: regra estadual vigente sem campo 'sobrepoe'. Se ela cria "
                "regra nova em vez de sobrepor um padrão, escreva 'sobrepoe: null' "
                "explicitamente."
            )

        if estado == "vigente" and r.get("revisar_ate"):
            try:
                prazo = datetime.date.fromisoformat(r["revisar_ate"])
            except ValueError:
                erros.append(f"{arq}: 'revisar_ate' não está em AAAA-MM-DD.")
            else:
                atraso = hoje - prazo
                if atraso > TOLERANCIA_REVISAO:
                    erros.append(
                        f"{arq}: revisão vencida em {prazo.isoformat()} "
                        f"({atraso.days} dias). Revise ou revogue a regra."
                    )

    if erros:
        print(f"{len(erros)} problema(s) nas regras federativas:\n", file=sys.stderr)
        for e in erros:
            print(f"  - {e}", file=sys.stderr)
        print("\nVer governanca/convencao-de-regras.md.", file=sys.stderr)
        return 1

    print(f"{len(regras)} regra(s) verificada(s): tudo consistente.")
    return 0


if __name__ == "__main__":
    sys.exit(main())
