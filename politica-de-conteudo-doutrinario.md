# Política de conteúdo doutrinário

Que material os aplicativos distribuem, quem o produz, quem o libera e como um
problema é reportado.

## Princípio

**A plataforma não produz doutrina.** Produzir material com rigor doutrinário já é
atribuição das áreas federativas, que têm coordenação, formação e responsabilidade
institucional para isso. A plataforma oferece o canal técnico, o controle de acesso e
o caminho de reporte — não uma nova instância de revisão paralela à que já existe.

## Regra de origem

A plataforma distribui **exclusivamente**:

1. **A Codificação** — as obras de Allan Kardec e o material de domínio público
   correlato.
2. **Material da FEB**, publicado ou expressamente autorizado.
3. **Material da UEM e de suas áreas federativas**, liberado pelo revisor da área.
4. **Material de outra federativa adotante**, liberado pelo revisor da área
   correspondente daquela federativa, e identificado com a origem.

Fora dessa lista, **nada é distribuído**. Em particular:

- **conteúdo autoral de voluntário não é publicado sem revisão** da área competente.
  Não importa a qualidade do texto nem a experiência de quem escreveu: o caminho é a
  área, sempre;
- material de autor externo, editora ou grupo não federativo não entra;
- material gerado por inteligência artificial **nunca** é publicado como conteúdo
  doutrinário, em nenhuma hipótese, mesmo revisado. A IA pode auxiliar a organizar,
  resumir para uso interno ou sugerir, mas o que o usuário lê como doutrina tem
  autoria humana e responsável identificado.

## Quem libera

Cada área federativa tem um **revisor de conteúdo** identificado, que responde pelo
material da sua área na plataforma. **Área sem revisor identificado não publica.**

O controle é técnico, não apenas normativo: o módulo de construção de recursos do
app-casas exige permissão explícita para produzir e para liberar material, e as duas
permissões são separadas. Quem escreve não é quem libera.

| Permissão | Quem tem | O que permite |
| :--- | :--- | :--- |
| `conteudo.redigir` | voluntário designado pela área | criar e editar rascunho |
| `conteudo.liberar` | revisor da área | publicar, despublicar, recolher |
| `conteudo.recolher.emergencia` | coordenação da ACSE e Encarregado | retirar do ar imediatamente |

Todo ato de liberação fica registrado em auditoria: quem liberou, quando, qual
versão. Isso protege tanto o leitor quanto o revisor.

## Reporte de problema pelo usuário

Quem lê precisa ter como avisar que algo está errado, e o caminho precisa ser curto.

- Todo material publicado exibe um **"Reportar problema neste conteúdo"** visível na
  própria tela, sem exigir login e sem formulário longo.
- O reporte classifica o tipo: erro de informação, problema doutrinário, conteúdo
  ofensivo, material fora de contexto, problema de acessibilidade.
- O reporte chega **ao revisor da área** e à coordenação da ACSE.
- **Prazo-alvo de primeira resposta: 7 dias corridos.**
- Reporte de conteúdo **ofensivo, discriminatório ou que exponha pessoa** é tratado
  como urgência: recolhimento imediato do material enquanto se avalia, com aviso ao
  revisor. Recolher primeiro e avaliar depois é a ordem correta quando há risco a
  alguém.
- O histórico de reportes de um material fica visível ao revisor da área. Um item
  que recebe reportes repetidos é um sinal, não um incômodo.

## Divergência de interpretação doutrinária

Divergências doutrinárias **não se resolvem em issue, em Pull Request nem em revisão
de código**. Um repositório de software não é o lugar dessa conversa, e tratá-la ali
produz atrito sem produzir esclarecimento.

O caminho é: o revisor da área recebe a divergência; se não se resolve na área, sobe
ao COFEMG, conforme o critério 2 do [processo de decisão](processo-de-decisao.md)
("altera texto doutrinário exibido ao público").

## Neutralidade

O escopo dos projetos é o **movimento espírita kardecista** organizado no Brasil.
Isso é delimitação de domínio, nunca juízo sobre outras religiões ou vertentes.
Nenhum material distribuído pela plataforma pode conter manifestação depreciativa a
outra religião, vertente ou prática, nem a quem não professa nenhuma. Ver o adendo do
[código de conduta](CODE_OF_CONDUCT.md).
