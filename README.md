# Governança do ecossistema

Repositório de **governança compartilhada** dos projetos digitais mantidos pela Área
de Comunicação Social Espírita (ACSE) da União Espírita Mineira (UEM).

As políticas, os modelos e as convenções vivem **aqui, uma única vez**. Os quatro
repositórios de projeto apontam para este, em vez de manterem cópias que divergiriam
com o tempo. Uma regra escrita em cinco lugares vira cinco regras diferentes em seis
meses.

## Os projetos

| Projeto | O que faz | Licença |
| :--- | :--- | :--- |
| [Casas Espíritas](https://github.com/ACSE-UEM/app-casas) | Ajuda a população a encontrar casas espíritas e atividades; ajuda a casa a se manter visível | AGPL-3.0 |
| [Voluntário Espírita](https://github.com/ACSE-UEM/app-voluntario) | Apoia o trabalhador voluntário no acompanhamento, estudo e capacitação | AGPL-3.0 |
| [Ontologia do Movimento Espírita Brasileiro](https://github.com/ACSE-UEM/ontologia-espirita) | Vocabulário e modelo conceitual comuns — **normativo** | CC BY 4.0 |
| [Painéis de Demografia](https://github.com/ACSE-UEM/analise-demografica) | Mostra o que uma região precisa, para o planejamento das áreas | CC BY 4.0 |

## Os quatro princípios

**1. Servir, nunca fiscalizar.** Os sistemas existem para apoiar a casa espírita, o
voluntário e a sociedade. A casa é autônoma e decide livremente se adere ao movimento
federativo; não aderir é escolha legítima e nunca é apresentada como pendência. Não
há ranking, não há meta cobrada, não há painel de desempenho sobre pessoas.

**2. Explícito, nunca descoberto.** O que importa é declarado por escrito, no lugar
onde quem precisa vai procurar. Regra que só existe na cabeça de alguém, ou que o
leitor precisa deduzir, não é regra: é armadilha.

**3. Um vocabulário só.** A ontologia define os termos; nenhum projeto os redefine.
Divergência necessária vira mudança na ontologia ou desvio declarado, com
justificativa e prazo.

**4. Conformidade primeiro.** Diante de um impasse, a ordem de desempate é:
conformidade legal, risco jurídico, segurança doutrinária, fraternidade. Nenhuma
conveniência técnica ou prazo de entrega altera essa ordem.

## Documentos

### Políticas

| Documento | Responde |
| :--- | :--- |
| [Proteção de dados pessoais](politica-lgpd.md) | Que dados tratamos, sob que base legal, por quanto tempo, e o que o titular pode exigir |
| [Publicação de dados](politica-de-publicacao-de-dados.md) | O que pode ser publicado, para quem, com que agregação — inclui a regra das casas não adesas |
| [Conteúdo doutrinário](politica-de-conteudo-doutrinario.md) | Que material os aplicativos distribuem, quem libera, como reportar problema |
| [Marca e atribuição](politica-de-marca.md) | Como usar (e não usar) os nomes e símbolos das instituições |
| [Segurança](SECURITY.md) | Como reportar uma falha e como tratamos incidentes |
| [Código de conduta](CODE_OF_CONDUCT.md) | Como nos tratamos, com adendo de fraternidade e neutralidade |

### Processo

| Documento | Responde |
| :--- | :--- |
| [Processo de decisão](processo-de-decisao.md) | Quem decide o quê: coordenação da ACSE ou COFEMG |
| [Papéis e responsabilidades](papeis-e-responsabilidades.md) | Quem faz o quê, e o que acontece quando um papel fica vago |
| [Estrutura comum](estrutura-comum.md) | Como os repositórios se organizam |
| [Convenção de regras](convencao-de-regras.md) | Como registrar o que varia entre federativas |
| [Glossário](glossario.md) | O vocabulário, em linguagem corrente |

### Modelos e ferramentas

| Caminho | Para quê |
| :--- | :--- |
| [`modelos/adr.md`](modelos/adr.md) | Registrar uma decisão de arquitetura |
| [`modelos/rfc.md`](modelos/rfc.md) | Propor mudança que exige decisão do COFEMG |
| [`modelos/regra.md`](modelos/regra.md) | Registrar regra que varia por federativa |
| [`modelos/pull_request_template.md`](modelos/pull_request_template.md) | Modelo de Pull Request com as verificações obrigatórias |
| [`scripts/guarda-pii.sh`](scripts/guarda-pii.sh) | Recusar dado pessoal antes que ele entre no repositório |
| [`scripts/pre-commit`](scripts/pre-commit) | Gancho que roda as guardas antes de cada commit |
| [`scripts/verifica_regras.py`](scripts/verifica_regras.py) | Verificar consistência das regras federativas |
| [`scripts/ci-guardas.yml`](scripts/ci-guardas.yml) | Guardas na integração contínua |
| [`DCO.txt`](DCO.txt) | Certificado de origem que cada commit assina |
| [`minutas/`](minutas/) | Minutas institucionais aguardando encaminhamento |

## Como decidimos

Mudanças técnicas e reversíveis são decididas pela **coordenação da ACSE** e
registradas em ADR. Vão à decisão do **COFEMG** as que:

1. alterem o modelo de dados nacional ou a API de federação;
2. alterem texto doutrinário exibido ao público;
3. criem ou ampliem tratamento de dado pessoal;
4. publiquem dado de outra federativa ou da FEB;
5. envolvam custo recorrente ou contrato.

Acima dos dois estão a lei, a autonomia da casa espírita e a carta de valores de cada
produto. Na dúvida sobre o nível, trate como nível 2 e pergunte: errar para cima
custa uma reunião, errar para baixo custa uma retratação.

Detalhes em [processo de decisão](processo-de-decisao.md).

## Pendências institucionais em aberto

Estas pendências são declaradas publicamente porque afetam quem usa e quem colabora,
e porque escondê-las contrariaria o segundo princípio.

| Pendência | Efeito | Situação |
| :--- | :--- | :--- |
| **Endosso institucional da UEM aos projetos** | A UEM figura como controladora de dados sem ter ratificado formalmente | [minuta redigida](minutas/termo-de-endosso-uem.md), aguarda encaminhamento |
| **Nomeação do Encarregado (DPO)** | Sem ele não há canal formal para o titular de dados; bloqueia o lançamento público | incluída na mesma minuta |
| **Autorização da FEB para uso dos dados públicos de casas** | Restringe o painel nacional a contagens agregadas | [minuta redigida](minutas/oficio-feb-webfec.md), aguarda encaminhamento |
| **Suplente do mantenedor do domínio da ontologia** | O modelo conceitual depende de uma única pessoa; bloqueia o lançamento público | [vaga aberta](papeis-e-responsabilidades.md) |
| **Autorização para reprodução de textos institucionais** | Descrições de áreas transcritas de publicações institucionais **já estão publicamente acessíveis** nos repositórios, sob licença que autoriza terceiros a reproduzi-las | ação imediata: obter autorização da UEM ou reescrever |
| **Conselho de federativas** | Previsto como dono do núcleo comum; ainda não existe. O COFEMG exerce o papel de forma declaradamente provisória | a constituir |

## Contribuir

Não é preciso ser espírita para colaborar, e não é preciso pedir autorização para
começar. Leia o [código de conduta](CODE_OF_CONDUCT.md), assine seus commits com
`git commit -s` ([DCO](DCO.txt)) e escreva em português brasileiro.

## Licença

[CC BY 4.0](LICENSE). O texto do código de conduta é o Contributor Covenant 2.1, em
tradução oficial, também sob CC BY 4.0. O texto do DCO é da Linux Foundation,
reproduzido literalmente conforme sua própria permissão.

Este é **trabalho voluntário, sem finalidade lucrativa**.
