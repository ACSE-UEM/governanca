# Convenção de regras federativas

Como registrar uma regra que **varia entre federativas** sem espalhar exceções pelo
texto dos documentos e sem quebrar a base comum.

Aplica-se ao **app-casas** e ao **app-voluntario**, que têm comportamento variável por
federativa. Não se aplica à ontologia (que descreve o que é comum) nem aos painéis
demográficos (que não têm regra de comportamento por estado).

## O problema que resolve

Sem convenção, uma diferença estadual vira uma frase no meio de um documento
("...exceto em São Paulo, onde o prazo é de 30 dias..."). Seis meses depois ninguém
sabe quantas exceções existem, quais ainda valem, nem o que quebra ao mudar o padrão.

A convenção troca prosa por **arquivo com identificador estável**, que pode ser
listado, contado, revisado por data e verificado automaticamente.

## Cadeia de precedência

```text
Lei — LGPD, ECA e demais normas aplicáveis
  └─► não sobreponível por nenhuma regra de projeto
      │
      ▼
BR-NNN — padrões do ecossistema, válidos em todo o Brasil
      │
      ▼
<UF>-NNN — regra da federativa estadual, que sobrepõe o padrão
      │
      ▼
Nota operacional da casa — documental, nunca altera comportamento do sistema
```

Uma regra estadual **sobrepõe** o padrão nacional apenas onde declara sobrepor, e
apenas naquilo que a lei permite variar. Uma regra estadual jamais pode ser mais
permissiva que a lei.

## Quando criar uma regra

Crie um arquivo de regra somente quando a diferença **muda o comportamento do
sistema**: um prazo, uma obrigatoriedade, uma permissão, uma visibilidade, uma
validação.

**Não** crie regra para diferença de aparência ou de vocabulário. O nome local de um
órgão ("CRE" em Minas, "URE" no Rio Grande do Sul), a identidade visual e os textos
de interface são **atributos do perfil da federativa**, não regras.

| Situação | É regra? |
| :--- | :--- |
| Em SP a candidatura é anonimizada em 3 meses, não em 6 | **sim** |
| Em MG a macrorregião chama-se "Regional" | não — perfil |
| Federativa X exige documento que o padrão não exige | **sim** |
| Federativa Y usa outro logotipo e outras cores | não — perfil |
| Federativa Z não habilita o módulo de eventos | não — configuração |

## Numeração

- **`BR-NNN`** — padrão nacional. Numeração sequencial a partir de `BR-001`.
- **`<UF>-NNN`** — regra estadual, com a sigla oficial da unidade federativa:
  `MG-001`, `SP-001`, `RS-001`.
- Número **nunca é reutilizado**. Regra revogada muda de estado, não desaparece.

Estrutura no repositório:

```text
docs/regras/
├── LEIA-ME.md          # índice de todas as regras vigentes
├── _modelo.md          # o modelo abaixo
├── BR/
│   ├── BR-001-consentimento-de-vinculo.md
│   ├── BR-002-retencao-de-candidatura.md
│   └── BR-003-controle-de-acesso.md
├── MG/
│   └── MG-001-....md
└── SP/
    └── SP-001-retencao-de-candidatura.md
```

## Modelo de arquivo de regra

```markdown
---
id: SP-001
ambito: SP                 # BR para padrão nacional; sigla da UF para regra estadual
estado: vigente            # proposta | vigente | revogada
sobrepoe: BR-002           # identificador da regra que esta modifica; null se nenhuma
revogada_por: null
decidida_em: 2026-09-07
decidida_por: COFEMG       # ou "coordenação da ACSE", conforme o nível da decisão
revisar_ate: 2027-09-07    # ciclo de 12 meses
---

# SP-001 — Retenção de candidatura a voluntariado

## Regra

Em uma frase imperativa e sem ambiguidade, o que deve ser verdadeiro.

## Fundamento

Por que a regra existe: exigência legal, orientação da federativa, prática local
consolidada. Cite a fonte.

## Alcance

O que muda em relação ao padrão que ela sobrepõe, e o que permanece igual.

## Impacto

- **produto:** que tela ou fluxo muda
- **dados:** que campo, prazo ou retenção muda
- **código:** onde a regra é aplicada
- **conformidade:** o que o Encarregado precisa saber
```

## Verificação automática

A integração contínua recusa o Pull Request quando:

1. uma regra `<UF>-NNN` declara `sobrepoe:` um identificador que não existe;
2. uma regra `<UF>-NNN` sobrepõe uma regra `BR` **sem** o campo `sobrepoe`
   preenchido;
3. dois arquivos usam o mesmo identificador;
4. uma regra `vigente` está com `revisar_ate` vencido há mais de 90 dias;
5. uma regra tenta sobrepor regra marcada como **não sobreponível** (as que
   decorrem diretamente da lei).

## Regras não sobreponíveis

Marcadas com `sobreponivel: nao` no cabeçalho, decorrem diretamente da lei e nenhuma
federativa pode afrouxá-las. Uma federativa pode ser **mais** restritiva, nunca
menos. Casos previstos:

- idade mínima de conta e consentimento do responsável legal (LGPD e ECA);
- proibição de expor vínculo religioso de pessoa em superfície pública;
- prazo máximo de resposta a direito do titular;
- agregação mínima k ≥ 5 em dado estatístico publicado;
- proibição de coletar dado de pessoa atendida.

## Quem decide

Criar ou alterar regra `BR` é decisão de **nível 2** (COFEMG), pelo critério 1 do
[processo de decisão](processo-de-decisao.md). Criar regra `<UF>` é decisão da
federativa correspondente, que a submete por Pull Request e a mantém.
