# Glossário unificado

Vocabulário comum aos quatro projetos. **A fonte normativa é a ontologia**
(`ontologia-espirita`); este glossário é a porta de entrada em linguagem corrente e
aponta para lá.

> **Regra de ouro do vocabulário.** Nenhum repositório redefine um termo que já
> existe na ontologia. Se um projeto precisa de um significado diferente, isso é uma
> mudança na ontologia (decisão de nível 2) ou um **desvio declarado** em
> `docs/01-dominio/desvios-da-ontologia.md`, com justificativa e prazo. Nunca uma
> definição paralela silenciosa.

## Termos que costumam ser confundidos

| Use | Não use | Por quê |
| :--- | :--- | :--- |
| **órgão** | organização, entidade | "órgão" é o termo do movimento para estrutura de unificação |
| **assistido** | beneficiário, assistido social | "beneficiário" tem carga assistencialista alheia ao movimento |
| **casa** ou **casa espírita** | ONG, instituição religiosa, unidade | o movimento não se descreve como ONG |
| **adesão** | filiação, cadastro obrigatório, credenciamento | a casa **adere** por decisão própria; não é filiada nem credenciada |
| **conhecida** / **prevista** | pendente, irregular, faltante, não conforme | não aderir é escolha legítima da casa autônoma |
| **frequentador** | membro, fiel, associado | a casa espírita não tem fiéis |
| **voluntário** ou **tarefeiro** | funcionário, colaborador, recurso | trabalho espírita é voluntário e gratuito |

## Instituições

| Termo | Definição |
| :--- | :--- |
| **Instituição** | Qualquer entidade institucional do movimento: casa ou órgão. Termo de topo. |
| **Casa** | Instituição espírita **autônoma** de base. Decide por si se adere ao movimento federativo. Um centro, um hospital, um lar ou uma livraria espírita são casas. **Casa nunca é órgão.** |
| **Centro** | O caso mais comum de casa: centro espírita que realiza atividades regulares. |
| **Órgão** | Instituição de unificação e coordenação. Disjunto de casa. |
| **Federativa** | Entidade federativa, nacional (FEB) ou estadual (UEM em Minas Gerais). |
| **Órgão unificador** | Órgão interno de uma federativa, que orienta e organiza o movimento no seu âmbito. COFEMG dentro da UEM; CFN dentro da FEB. |
| **Órgão regional** | Recorte regional de uma federativa estadual: macrorregião ou microrregião. |
| **Órgão municipal** | Órgão municipal ou intermunicipal de apoio às casas. Em Minas Gerais, AME. |

### Nomes locais dos níveis regionais

Os níveis do modelo são **macrorregião** e **microrregião**. Cada estado usa nomes
próprios, que são atributo da instância e nunca classe do modelo. Um estado pode ter
zero, um ou dois níveis regionais: o Distrito Federal vai direto de federativa para
casas.

| Nível do modelo | Nome formal em MG | Nome usual em MG | Outros estados |
| :--- | :--- | :--- | :--- |
| Macrorregião | Comissão Regional (CR) | **Regional** | Regional, Polo |
| Microrregião | Conselho Regional Espírita (CRE) | **CRE** | URE, Setor, Polo |
| Órgão municipal | Aliança Municipal Espírita (AME) | **AME** | CEM |

Em Minas Gerais, **os dois nomes da macrorregião são corretos**: "Comissão Regional"
é o formal e "Regional" é o usual. A interface usa o usual; documentos institucionais
usam o formal. O modelo guarda os dois.

## Vínculos

| Termo | Definição |
| :--- | :--- |
| **adere a** | Vínculo formal da casa com a federativa. **Opcional** — a casa tem autonomia para decidir. |
| **situação de adesão** | Adesa, pendente, prevista ou conhecida. "Pendente" descreve um pedido em andamento, jamais uma falta. |
| **atendida por** | Caminho administrativo de apoio (AME, CRE, Regional). Independente da adesão: uma casa pode ser apoiada sem ter aderido. |
| **parte de** | Relação hierárquica **entre órgãos**. Uma casa nunca é parte de um órgão. |
| **órgão interno de** | Do órgão unificador para a sua federativa. |

## Realizações

| Termo | Definição |
| :--- | :--- |
| **Realização** | O que uma instituição realiza. Termo de topo. |
| **Atividade** | Realização **periódica** — a palestra pública de toda quinta-feira. |
| **Evento** | Realização **datada**, com início e fim — a Semana Espírita de outubro. **Não é uma atividade**: são irmãos disjuntos no modelo. |
| **Tipo de atividade** | Vocabulário de tipos: palestra pública, reunião mediúnica, ESDE, evangelização infantil. |
| **apoiada por** | Áreas que podem apoiar a casa num tipo de atividade. Pode ser vazia, pode ser várias. **Nunca é composição**: a atividade não pertence a uma área. |
| **modalidade** | Presencial, virtual ou híbrida. |

## Áreas

| Termo | Definição |
| :--- | :--- |
| **Área federativa** | Área de trabalho do movimento federativo. Termo canônico da ontologia. |
| *área funcional* | **Sinônimo** em uso corrente no app-casas e nos painéis. Equivalente a área federativa; a migração para o termo canônico é gradual. |

### As áreas

Dez **áreas-fim**, que realizam o trabalho doutrinário e assistencial:

| Sigla | Área |
| :--- | :--- |
| AAE | Atendimento Espiritual |
| AA | Arte |
| ACSE | Comunicação Social Espírita |
| AEE | Estudo do Espiritismo |
| AEEJ | Estudo do Evangelho de Jesus |
| AESP | Esperanto |
| AFam | Família |
| AIJ | Infância e Juventude |
| AOM | Orientação Mediúnica |
| APSE | Promoção Social Espírita |

Uma **área-meio**, que sustenta o funcionamento institucional:

| Sigla | Área |
| :--- | :--- |
| AG | Administração Geral (também referida como Área de Gestão) |

A distinção entre área-fim e área-meio é a que concilia as leituras divergentes que
existiam nos repositórios: AG existe e está registrada, e ao mesmo tempo não se
comporta como as dez áreas-fim. Cada aplicativo decide por configuração se a exibe.

## Pessoas

| Termo | Definição |
| :--- | :--- |
| **Voluntário** | Atua em uma instituição, casa ou órgão, e pode atuar em uma ou mais áreas. Também chamado **tarefeiro**. |
| **Coordenador** | Voluntário que responde por uma atividade (na casa) ou por uma área (no órgão). |
| **Dirigente** | Dirige uma instituição. |
| **Frequentador** | Participa de atividades regulares. |
| **Assistido** | Recebe amparo social ou espiritual. **Nunca se diz "beneficiário".** |
| **Público-alvo** | Quem a instituição atende. |

> **Atenção de conformidade.** O vínculo de uma pessoa a uma casa espírita revela
> **convicção religiosa** e é dado pessoal sensível (LGPD, art. 5º, II). A plataforma
> **não coleta dados de pessoas assistidas**. Ver [politica-lgpd.md](politica-lgpd.md).

## Território

| Termo | Definição |
| :--- | :--- |
| **Município** | Carrega o código IBGE de 7 dígitos, chave de cruzamento entre todos os projetos. É o vínculo jurídico da casa, inclusive da casa só virtual. |
| **Unidade federativa** | Estado brasileiro. Termo do IBGE, **sem relação** com o movimento federativo espírita. |
| **Localidade** | Distrito ou bairro, na terminologia do IBGE. |

## Siglas institucionais

| Sigla | Significado |
| :--- | :--- |
| ACSE | Área de Comunicação Social Espírita |
| AME | Aliança Municipal Espírita (órgão municipal em MG) |
| ANPD | Autoridade Nacional de Proteção de Dados |
| CFN | Conselho Federativo Nacional, da FEB |
| COFEMG | Conselho Federativo Espírita de Minas Gerais |
| CR | Comissão Regional (macrorregião em MG; usualmente "Regional") |
| CRE | Conselho Regional Espírita (microrregião em MG) |
| ECA | Estatuto da Criança e do Adolescente (Lei 8.069/1990) |
| FEB | Federação Espírita Brasileira |
| IBGE | Instituto Brasileiro de Geografia e Estatística |
| LGPD | Lei Geral de Proteção de Dados (Lei 13.709/2018) |
| MEB | Movimento Espírita Brasileiro |
| PTMEB | Plano de Trabalho para o Movimento Espírita Brasileiro (2018–2028) |
| UEM | União Espírita Mineira, federativa estadual de Minas Gerais |

## Escopo doutrinário

Os projetos cobrem o **movimento espírita kardecista** organizado no Brasil. Umbanda,
candomblé e outras vertentes não fazem parte do domínio modelado. Isso é delimitação
técnica de escopo, e **nunca** juízo sobre outras religiões ou práticas. Ver o adendo
do [código de conduta](CODE_OF_CONDUCT.md).
