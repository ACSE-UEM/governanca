# Política de publicação de dados

O que pode ser publicado, para quem, e com que agregação. Vale principalmente para os
painéis de demografia e para as páginas públicas do app-casas.

## Princípio: servir, nunca fiscalizar

Os dados existem para **ajudar a casa espírita, o voluntário e a sociedade a se
encontrarem e a se apoiarem**. Não existem para medir desempenho de órgão, para
comparar federativas, nem para expor quem não faz parte de algo.

Toda publicação passa por esta pergunta: **quem é ajudado por ver isto?** Se a
resposta só descreve quem seria cobrado, a publicação não acontece.

## As três audiências

| Audiência | Quem é | O que enxerga |
| :--- | :--- | :--- |
| **Pública** | qualquer pessoa na internet | dados institucionais de casas ativas e agregados por município ou região |
| **Interna do órgão** | órgão de unificação, sobre a própria jurisdição | o detalhamento da sua área de atuação, incluindo situação de adesão |
| **Interna da casa** | a própria casa | seus próprios dados, completos |

Um órgão enxerga a **sua** jurisdição, jamais a de outro no mesmo nível. Uma CRE não
enxerga o detalhamento de outra CRE. Isso não é desconfiança: é a mesma lógica que
impede comparação e ranking entre pares.

## Casas não adesas ou em revisão — regra explícita

Coordenadores regionais pediram a exibição de casas que existem e são conhecidas do
movimento kardecista, mas que **não aderiram** à federativa. O pedido é legítimo e
tem finalidade fraterna: saber quem está por perto para poder se aproximar. Ele
também é o pedido com maior risco de ser lido como fiscalização. Por isso a regra é
explícita, e não fica a critério de quem implementa.

**A casa espírita é autônoma e decide livremente se adere ao movimento federativo.**
Não aderir é escolha legítima, não é pendência, não é irregularidade, e não pode ser
apresentada como tal.

`esp:statusAdesao` é tri-estado: **Adesa**, **NaoAdesa** e **EmRevisao**. "EmRevisao"
não é falta da casa — no site legado, o vínculo de adesão nasce de um link de
inscrição público, e passa por conferência da equipe antes de ser confirmado como
Adesa. Uma casa em EmRevisao pode ter se inscrito ontem ou pode nunca ter pedido
nada e ter sido submetida por terceiros: **o dado ainda não foi verificado**, o que
o torna mais sensível de expor nominalmente do que uma casa NaoAdesa, não menos.

### Permitido

- No **painel interno do órgão que atende aquela região**: listar casas não adesas
  ou em revisão, com o dado que se tem, para que o órgão possa **se aproximar,
  convidar e oferecer apoio**.
- No **painel público**: contagem agregada por município, quando respeitar
  k ≥ 5 — por exemplo "18 casas espíritas conhecidas em Uberaba".

### Proibido

- Publicar **nome, endereço ou contato** de casa **NaoAdesa ou EmRevisao** em
  qualquer superfície pública. Isso vale igualmente para as duas — EmRevisao **não**
  é uma exceção por parecer mais próxima de Adesa, é dado não verificado.
- Qualquer rótulo que sugira falta, atraso ou irregularidade: "pendente",
  "irregular", "não conforme", "faltante", "a regularizar". O vocabulário correto é
  **"não adesa"**, **"em revisão"** e **"adesa"**, conforme a ontologia.
- Ranking, classificação ou comparação entre órgãos, regiões ou federativas por taxa
  de adesão, em qualquer audiência.
- Meta de adesão apresentada como cobrança a um órgão ou a uma casa.
- Uso da lista de não adesas ou em revisão para contato em massa. A aproximação é
  pessoal e fraterna, feita por quem conhece a região.

> **Pendente de decisão (nível 2).** O painel público em produção
> (`demografia-uem.pages.dev/cres/...`) hoje publica nome de casas com status
> EmRevisao nominalmente, o que a regra acima proíbe. Isso não é desvio declarado
> conforme a [regra de ouro do glossário](glossario.md) — é uma publicação que
> ficou à frente desta política. Precisa de decisão de quem mantém o domínio:
> agregar EmRevisao no painel público (tratamento igual a NaoAdesa) até confirmação,
> ou formalizar uma exceção com justificativa e prazo. Até essa decisão, tratar como
> **não conforme com esta política**, não como funcionalidade aceita.

### Como o painel apresenta

Comparações regionais existem para **encontrar quem precisa de apoio**, e a
apresentação precisa deixar isso claro no próprio texto da tela. Em vez de
"Regional Triângulo: 62% de adesão (3º lugar)", a leitura correta é "Regional
Triângulo: 18 casas conhecidas ainda sem contato do órgão — talvez uma visita ajude".

O painel não publica posição, medalha nem tabela de liderança entre órgãos.

## Dados vindos da FEB (webfec)

Parte dos dados de casas de outros estados foi extraída do site da FEB
(`webfec.org.br`). **Não existe autorização expressa da FEB** para essa extração nem
para a republicação.

Enquanto não houver autorização escrita:

1. O site público de alcance nacional exibe **apenas contagens agregadas** por
   município e por unidade federativa. Nada de nome, endereço ou contato de casa de
   outro estado.
2. Toda página que use esses dados **declara a proveniência**: "dados de casas
   espíritas compilados a partir da consulta pública da Federação Espírita
   Brasileira, em <data>".
3. O dado bruto extraído **não é redistribuído** como arquivo.
4. Qualquer pedido da FEB de correção ou de retirada é atendido de imediato, sem
   discussão prévia.

A minuta de solicitação de autorização está em
[minutas/oficio-feb-webfec.md](minutas/oficio-feb-webfec.md).

## Agregação mínima

**k ≥ 5** em toda célula publicada, conforme a [política de LGPD](politica-lgpd.md).
Célula suprimida é exibida como "dado suprimido para proteger a privacidade", nunca
como zero e nunca em branco.

## Honestidade do dado

- Todo painel informa **a data e a fonte** de cada conjunto de dados exibido.
- Dado estimado, sintético ou de exemplo é **marcado visivelmente como tal**, na
  própria visualização e não apenas em nota de rodapé.
- Dado ausente é exibido como ausente. Nunca se preenche lacuna com zero, com média
  ou com estimativa silenciosa.
- Saída de inteligência artificial é identificada como tal e passa por revisão humana
  antes de virar recomendação. **Insight não é proposta**: o sistema descreve o que
  os dados mostram; decidir o que fazer é das pessoas.
