# Papéis e responsabilidades

Quem faz o quê no ecossistema. Um papel é uma **função**, não um cargo: uma pessoa
pode acumular papéis, e um papel pode ser exercido por mais de uma pessoa.

Todo papel abaixo tem: o que faz, o que pode decidir, e o que acontece quando está
vago. A última coluna existe porque trabalho voluntário tem rotatividade, e um papel
sem sucessão previsto é um risco operacional, não um detalhe administrativo.

## Papéis institucionais

### Coordenação da ACSE

- **Faz:** conduz os quatro projetos, mantém os repositórios, executa o processo de
  decisão de nível 1, prepara as propostas de nível 2, aplica o código de conduta.
- **Decide:** tudo do nível 1 do [processo de decisão](processo-de-decisao.md).
- **Não decide:** os cinco critérios de nível 2.
- **Se vago:** os repositórios entram em congelamento de mudanças de núcleo; apenas
  correções de segurança são aceitas, até que o COFEMG designe substituição.

### COFEMG

- **Faz:** decide os cinco critérios de nível 2; zela pelo alinhamento doutrinário;
  revisa decisões de banimento permanente.
- **Decide:** modelo de dados nacional, conteúdo doutrinário público, ampliação de
  tratamento de dado pessoal, publicação de dado de terceiros, custo recorrente.

### Encarregado pelo tratamento de dados pessoais (DPO)

- **Faz:** é o canal do titular de dados e da ANPD; mantém o inventário de dados;
  aprova ou veta tratamentos novos; conduz a resposta a incidente com dado pessoal.
- **Decide:** tem **veto** sobre qualquer tratamento de dado pessoal, em qualquer
  repositório, inclusive contra decisão da ACSE.
- **Estado atual:** **não nomeado.** Esta é a pendência de conformidade mais urgente
  do ecossistema — ver [politica-lgpd.md](politica-lgpd.md) e a
  [minuta de endosso](minutas/termo-de-endosso-uem.md).
- **Se vago:** nenhum tratamento novo de dado pessoal pode ser iniciado, e nenhum
  produto pode ser lançado ao público.

## Papéis técnicos

### Mantenedor do repositório

- **Faz:** revisa e integra contribuições, cuida da qualidade e das automações,
  responde a quem colabora.
- **Decide:** aceitar ou recusar uma contribuição, dentro do nível 1.
- **Se vago:** o repositório é marcado como **sem manutenção** no `README.md`, de
  forma visível. Um repositório público sem mantenedor declarado engana quem chega.

### Mantenedor do domínio da ontologia

O papel mais sensível do ecossistema: a ontologia é normativa para todos os
projetos, e quem a mantém decide o vocabulário que todos usam.

- **Faz:** valida cada mudança no modelo conceitual contra a realidade do movimento
  federativo; responde pelas perguntas de competência; aprova mudanças em elemento
  crítico.
- **Decide:** aceitar ou recusar mudança de modelo, dentro do nível 1; mudanças que
  alterem o modelo nacional sobem ao nível 2.
- **Estado atual:** exercido por **uma única pessoa**, sem suplente.

> ### Vaga aberta e obrigatória: suplente do mantenedor do domínio
>
> O ecossistema inteiro depende hoje de uma pessoa para validar o modelo conceitual.
> Se essa pessoa se afastar, os quatro projetos ficam sem quem responda "o modelo
> está certo?", e a ontologia congela. **Preencher esta vaga é requisito para o
> lançamento público de qualquer um dos produtos.**
>
> **O que o suplente precisa saber:** o movimento federativo por dentro — a
> diferença entre casa e órgão, o que é adesão, como as áreas se organizam, como os
> níveis regionais variam entre estados. Conhecimento técnico de OWL, SHACL ou
> SPARQL **não é requisito**: é ensinável, e a validação que importa é a do domínio.
>
> **Responsabilidades:**
> 1. Ler e aprovar toda mudança em elemento crítico, junto com o titular.
> 2. Responder pela ontologia quando o titular estiver ausente.
> 3. Revisar anualmente o glossário e o catálogo de referência.
> 4. Registrar em ADR toda decisão de modelo, com a justificativa de domínio.
> 5. Recusar mudança que a realidade do movimento não sustente, mesmo quando a
>    proposta for tecnicamente elegante.
>
> **Quem pode ser:** voluntário com experiência em órgão de unificação (federativa,
> regional ou municipal) ou em coordenação de área federativa. Indicação pela
> coordenação da ACSE, referendada pelo COFEMG.

### Revisor de conteúdo por área federativa

- **Faz:** produz e libera o material doutrinário e de capacitação que os aplicativos
  distribuem, dentro da sua área.
- **Decide:** o que da sua área entra na plataforma.
- **Base:** a produção de material com rigor doutrinário **já é atribuição das áreas
  federativas**. A plataforma não cria um novo processo de revisão; ela dá o canal
  técnico e o controle de acesso para o processo que já existe. Ver
  [politica-de-conteudo-doutrinario.md](politica-de-conteudo-doutrinario.md).
- **Se vago numa área:** a área não publica. Nenhum material da área é distribuído
  sem revisor identificado.

### Revisor regional de cadastro (app-casas)

- **Faz:** avalia pedidos de adesão de casas na sua jurisdição, arbitra disputas de
  posse de cadastro, trata denúncias de conteúdo.
- **Decide:** aprovar, recusar ou suspender um cadastro de casa.
- **Se vago:** a federativa remaneja a fila para outro revisor. Fila parada é
  visível no painel da federativa por desenho.

## Papéis de quem contribui de fora

### Colaborador

Qualquer pessoa que proponha mudança por Pull Request. Não precisa ser espírita, não
precisa ser voluntário de casa, não precisa pedir autorização para começar. Assina
cada commit com `Signed-off-by`, conforme o [DCO](DCO.txt).

### Federativa adotante

Federativa estadual que opera sua própria instância. Direitos e deveres no
`GOVERNANCE.md` do produto adotado. Não pode alterar o núcleo travado nem usar as
marcas da UEM de modo a sugerir endosso — ver
[politica-de-marca.md](politica-de-marca.md).

## Tabela de vacâncias — estado em 2026-09-07

| Papel | Ocupado? | Consequência da vacância |
| :--- | :--- | :--- |
| Coordenação da ACSE | sim | — |
| COFEMG | sim, mas **sem endosso formal aos projetos** | risco institucional aberto |
| Encarregado (DPO) | **não** | bloqueia lançamento público |
| Mantenedor de repositório | sim, concentrado | risco de pessoa única |
| Mantenedor do domínio da ontologia | sim, sem suplente | **bloqueia lançamento público** |
| Revisor de conteúdo por área | a confirmar por área | área sem revisor não publica |
| Revisor regional (app-casas) | rede da UEM/COFEMG existe | — |
