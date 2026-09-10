# Estrutura comum dos repositórios

Padrão único de organização para os quatro repositórios do ecossistema
(`ontologia-espirita`, `app-casas`, `app-voluntario`, `analise-demografica`) e para o
repositório de governança compartilhada (`governanca`).

O padrão é definido por **papéis**, não por caminhos rígidos: cada papel precisa
existir e ser encontrável a partir do `README.md`. Isso preserva o que já funciona
(a pasta `spec/` do app-casas, a pasta `ontology/` da ontologia) e ainda dá a base
unificada e extensível que o ecossistema precisa.

## Princípio: papéis obrigatórios

Todo repositório do ecossistema declara, na raiz e em `docs/`, os papéis abaixo.
Um papel pode ser cumprido por um arquivo, por uma pasta, ou por um link para o
repositório `governanca`. Um papel **nunca** pode estar ausente sem justificativa
escrita no `README.md`.

| # | Papel | Responde à pergunta | Caminho canônico |
| :--- | :--- | :--- | :--- |
| 1 | Porta de entrada | O que é isto e por onde começo? | `README.md` |
| 2 | Licença | O que posso fazer com isto? | `LICENSE` |
| 3 | Como contribuir | Como proponho uma mudança? | `CONTRIBUTING.md` |
| 4 | Conduta | Como nos tratamos? | `CODE_OF_CONDUCT.md` (link para `governanca`) |
| 5 | Segurança | Como reporto uma falha ou um vazamento? | `SECURITY.md` (link para `governanca`) |
| 6 | Governança | Quem decide o quê? | `GOVERNANCE.md` |
| 7 | Histórico | O que mudou e quando? | `CHANGELOG.md` |
| 8 | Visão e escopo | Para que servimos e o que não fazemos? | `docs/00-visao/` |
| 9 | Domínio e vocabulário | O que cada termo significa? | `docs/01-dominio/` |
| 10 | Conformidade | Que dados tratamos e sob que base legal? | `docs/02-conformidade/` |
| 11 | Produto | Quem usa, para quê e como? | `docs/03-produto/` |
| 12 | Arquitetura e decisões | Como é construído e por quê? | `docs/04-arquitetura/`, com `adr/` dentro |
| 13 | Operação | Onde roda, quem opera, como restaurar? | `docs/05-operacao/` |
| 14 | Colaboração | Quem faz o quê, em que ritmo? | `docs/06-colaboracao/` |
| 15 | Regras federativas | O que muda por federativa? | `docs/regras/` (só produtos com variação) |

Os papéis 4, 5 e parte do 6 vivem **uma única vez** no repositório `governanca`.
Os demais repositórios os cumprem com um arquivo curto que aponta para lá. Isso evita
que cinco cópias da mesma política divirjam com o tempo.

## Árvore de referência

Esta é a árvore completa de um repositório de produto (app-casas, app-voluntario).
Repositórios de conhecimento (ontologia) e de dados (analise-demografica) usam o
mesmo esqueleto sem as pastas que não se aplicam, conforme a tabela da seção
seguinte.

```text
<repositorio>/
├── README.md                        # papel 1 — porta de entrada
├── LICENSE                          # papel 2
├── CONTRIBUTING.md                  # papel 3
├── CODE_OF_CONDUCT.md               # papel 4 — aponta para governanca
├── SECURITY.md                      # papel 5 — aponta para governanca
├── GOVERNANCE.md                    # papel 6 — específico + aponta para governanca
├── CHANGELOG.md                     # papel 7
├── Makefile                         # alvos de lint, teste, validação e guardas
├── docs/
│   ├── LEIA-ME.md                   # mapa de todos os documentos deste repositório
│   ├── 00-visao/
│   │   ├── visao-e-escopo.md        # o que é, para quem, e o que NÃO é
│   │   ├── principios.md            # princípios de produto, inclui a regra de tom
│   │   ├── nao-objetivos.md         # "não faremos X" — explícito, com o porquê
│   │   └── publicos-e-personas.md
│   ├── 01-dominio/
│   │   ├── vocabulario.md           # ponte para a ontologia; nunca redefine termo
│   │   ├── dicionario-de-dados.md   # termo da ontologia → campo/tabela/coluna
│   │   └── desvios-da-ontologia.md  # cada divergência, com justificativa e prazo
│   ├── 02-conformidade/
│   │   ├── inventario-de-dados.md   # todo dado pessoal tratado, com base legal
│   │   ├── lgpd.md                  # papéis, direitos do titular, retenção
│   │   ├── menores.md               # regra 16+ e proteção de infância e juventude
│   │   ├── consentimentos.md
│   │   └── riscos-e-mitigacao.md
│   ├── 03-produto/
│   │   ├── jornadas.md
│   │   ├── requisitos.md
│   │   ├── backlog.md
│   │   └── criterios-de-ux.md
│   ├── 04-arquitetura/
│   │   ├── visao-geral.md
│   │   ├── requisitos-arquiteturais.md
│   │   ├── integracoes.md
│   │   └── adr/
│   │       ├── LEIA-ME.md           # índice dos ADRs e como escrever um
│   │       └── 0001-....md
│   ├── 05-operacao/
│   │   ├── ambientes.md
│   │   ├── publicacao.md
│   │   ├── backup-e-restauracao.md
│   │   ├── resposta-a-incidentes.md
│   │   └── contas-e-fornecedores.md # sobrevive à rotatividade de voluntários
│   ├── 06-colaboracao/
│   │   ├── papeis.md                # quem faz o quê neste repositório
│   │   ├── fluxo-de-trabalho.md
│   │   └── revisao.md
│   └── regras/                      # só onde há variação por federativa
│       ├── LEIA-ME.md               # numeração, precedência e como propor
│       ├── BR/                      # padrões nacionais — BR-001, BR-002...
│       └── MG/                      # sobreposições estaduais — MG-001...
├── .github/
│   ├── pull_request_template.md
│   ├── ISSUE_TEMPLATE/
│   └── workflows/
└── src/ | ontology/ | code/         # o artefato técnico do repositório
```

## Onde cada papel vive hoje, por repositório

Nenhum arquivo precisa ser movido agora. A coluna "hoje" mostra o que já existe e
cumpre o papel; a coluna "ação" diz o mínimo a fazer.

### `app-casas`

| Papel | Hoje | Ação |
| :--- | :--- | :--- |
| 1 Porta de entrada | `README.md` | substituir pelo proposto |
| 2 Licença | ausente | criar `LICENSE` (AGPL-3.0, texto em `propostas/app-casas/LICENSE`) |
| 3 Contribuir | `CONTRIBUTING.md` | acrescentar DCO e guarda de PII |
| 4 Conduta | ausente | criar apontando para `governanca` |
| 5 Segurança | ausente | criar apontando para `governanca` |
| 6 Governança | `GOVERNANCE.md` | acrescentar critério ACSE × COFEMG e ontologia normativa |
| 7 Histórico | ausente | criar `CHANGELOG.md` |
| 8 Visão | `VISION.md`, `spec/01` | manter; `VISION.md` continua a carta normativa |
| 9 Domínio | `spec/02` | passa a ser **dicionário de dados**, subordinado à ontologia |
| 10 Conformidade | `spec/07`, `spec/09` | manter; acrescentar inventário no formato comum |
| 11 Produto | `spec/03`, `05`, `08`, `13` | manter |
| 12 Arquitetura | `spec/12`, `plans/` | criar `docs/04-arquitetura/adr/` (já previsto) |
| 13 Operação | `spec/10` | manter; acrescentar contas e fornecedores |
| 14 Colaboração | `spec/04`, `CONTRIBUTING.md` | manter |
| 15 Regras | ausente | criar `docs/regras/` com `BR/` e `MG/` |

> A pasta `spec/` **permanece onde está** e continua sendo a fonte de verdade do
> produto (decisão D1, assunção A15). O que muda é o `docs/LEIA-ME.md`, que passa a
> declarar qual documento cumpre qual papel do padrão comum.

### `ontologia-espirita`

| Papel | Hoje | Ação |
| :--- | :--- | :--- |
| 1, 3, 7 | `README.md`, `docs/guia-de-contribuicao.md`, `CHANGELOG.md` | manter; README atualizado |
| 2 Licença | ausente | criar `LICENSE` (CC BY 4.0) |
| 4, 5 | ausentes | criar apontando para `governanca` |
| 6 Governança | disperso no guia | criar `GOVERNANCE.md` com o papel de mantenedor e o suplente |
| 9 Domínio | `ontology/`, `docs/glossario.md` | **é a fonte normativa do ecossistema** |
| 12 Decisões | `docs/decisoes/` | manter; renomear conceitualmente para ADR |
| 10, 11, 13, 15 | não se aplicam | declarar a ausência no `README.md` |

### `app-voluntario`

Repositório praticamente vazio (5 arquivos, nenhum commit). Recebe a árvore
completa a partir do zero, conforme `propostas/app-voluntario/`.

### `analise-demografica`

| Papel | Hoje | Ação |
| :--- | :--- | :--- |
| 1 Porta de entrada | `README.md` | substituir pelo proposto |
| 2 Licença | ausente | criar `LICENSE` (CC BY 4.0) |
| 3 Contribuir | ausente | criar |
| 4, 5 | ausentes | criar apontando para `governanca` |
| 6 Governança | ausente | criar |
| 8 Visão | `README.md`, `docs/specs/objetivos.md` | consolidar em `docs/00-visao/` |
| 9 Domínio | `fundamentacao/ontologia.md`, `docs/taxonomia.md` | **substituir por ponte para a ontologia** |
| 10 Conformidade | `riscos.md`, `viabilidade.md` | reescrever como inventário de dados e política de publicação |
| 13 Operação | `cd/README.md` | manter; é bom material |
| 15 Regras | não se aplica | declarar |

## Convenções que valem em todos os repositórios

**Idioma.** Documentação, nomes de pastas de conteúdo e mensagens de commit em
português brasileiro. Código, identificadores e nomes de arquivos técnicos podem ser
em inglês quando for a convenção da linguagem ou da ferramenta. Um documento nunca é
publicado só em inglês.

**Numeração de pastas.** Prefixo de dois dígitos (`00-`, `01-`) apenas nas pastas de
primeiro nível de `docs/`, para fixar a ordem de leitura. Arquivos internos não usam
prefixo numérico, exceto ADRs e regras, que usam identificador estável.

**Versionamento de arquivo.** Nunca `-v2`, `-r1`, `-revisao-final`. O arquivo no
caminho canônico é sempre a versão atual; o histórico é o git. Material superado vai
para `arquivo/` com prefixo de data.

**Prefixo de data.** Só em artefatos datados por natureza: atas, exportações de
dados, saídas de sessão. Especificações estáveis não levam data no nome.

**Identificadores estáveis.** ADR: `NNNN-titulo-curto.md` a partir de `0001`.
Regra federativa: `BR-NNN` e `<UF>-NNN` (ver `governanca/convencao-de-regras.md`).
Decisão de produto no app-casas: `D<n>`, assunção `A<n>`, pendência `P<n>` — a
convenção já em uso, preservada.

**Nada decidido em silêncio.** Toda decisão que altere comportamento, dado ou regra
vira ADR ou entrada no registro de decisões, com data e responsável.
