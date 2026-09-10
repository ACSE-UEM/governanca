# Processo de decisão

Quem decide o quê, com que evidência, e como a decisão fica registrada. Vale para os
quatro repositórios do ecossistema.

## Princípio

**Autoridade moral, não autoridade de comando.** Os órgãos do movimento federativo
atuam por cooperação e orientação, jamais por imposição sobre a casa espírita
autônoma. Este processo organiza a colaboração; ele não cria hierarquia sobre
ninguém.

**Nada decidido em silêncio.** Toda decisão que altere comportamento, dado, regra ou
texto público vira registro escrito, datado e assinado por quem decidiu.

## Os dois níveis de decisão

### Nível 1 — Coordenação da ACSE

Decide e registra em ADR, sem consulta prévia, tudo que seja técnico e reversível:

- escolha e troca de bibliotecas, ferramentas, formatos e padrões de código;
- estrutura de pastas, convenções de nomenclatura e organização documental;
- correções de defeito, refatorações e melhorias de desempenho;
- ajustes de texto de interface que não toquem conteúdo doutrinário;
- criação de ambientes de teste e de rascunho;
- priorização do backlog dentro do escopo já aprovado.

### Nível 2 — COFEMG

Vai obrigatoriamente à discussão e decisão do COFEMG, por proposta preparada pela
ACSE, tudo que se enquadre em **qualquer** dos cinco critérios:

| # | Critério | Exemplo concreto |
| :--- | :--- | :--- |
| 1 | Altera o **modelo de dados nacional** ou a **API de Federação** | Tornar a ontologia a fonte normativa do modelo, substituindo `spec/02` do app-casas |
| 2 | Altera **texto doutrinário** exibido ao público | Mudar a descrição de uma área federativa; publicar material de estudo |
| 3 | **Cria ou amplia tratamento de dado pessoal** | Passar a registrar presença de voluntário em atividade; sincronizar dados do app do voluntário para um servidor |
| 4 | **Publica dado de outra federativa ou da FEB** | Exibir casas de outros estados no painel público nacional |
| 5 | Envolve **custo recorrente ou contrato** | Contratar provedor de SMS, geocodificação ou hospedagem paga |

> **Regra do empate.** Na dúvida sobre o nível, trate como nível 2 e pergunte.
> Errar para cima custa uma reunião; errar para baixo custa uma retratação.

### O que nenhum dos dois pode decidir

Não são decidíveis por ACSE nem por COFEMG, porque estão acima do processo:

- **A lei.** LGPD (Lei 13.709/2018), Estatuto da Criança e do Adolescente e demais
  normas aplicáveis não são negociáveis nem sobreponíveis por regra de projeto.
- **A autonomia da casa espírita.** Nenhuma decisão pode obrigar uma casa a aderir,
  a informar dados ou a adotar um sistema.
- **A carta de visão e valores** de cada produto, que só muda pelo processo de RFC
  com aprovação do COFEMG.

## Fluxo de uma mudança

```text
  ideia ou necessidade
        │
        ▼
  ┌─────────────────┐   não   ┌──────────────────────────────┐
  │ Toca algum dos  ├────────►│ ACSE decide, registra em ADR │
  │ 5 critérios?    │         │ e abre o Pull Request        │
  └────────┬────────┘         └──────────────────────────────┘
           │ sim
           ▼
  ┌─────────────────────────────────────────────┐
  │ RFC: problema, proposta, impacto, riscos,   │
  │ alternativas — escrita pela ACSE            │
  └────────┬────────────────────────────────────┘
           ▼
  ┌─────────────────────────────────────────────┐
  │ Discussão pública na issue por 14 dias      │
  │ (prazo-alvo; encurtável só por urgência     │
  │ de segurança ou de conformidade legal)      │
  └────────┬────────────────────────────────────┘
           ▼
  ┌─────────────────────────────────────────────┐
  │ Apresentação e decisão no COFEMG            │
  └────────┬────────────────────────────────────┘
           ▼
  ┌─────────────────────────────────────────────┐
  │ ADR registrando a decisão, com a data da    │
  │ reunião e o resultado — inclusive se foi    │
  │ recusada                                    │
  └─────────────────────────────────────────────┘
```

Decisões recusadas também viram ADR, com estado `recusado`. Saber o que foi tentado
e rejeitado vale tanto quanto saber o que foi aprovado, e evita que a mesma proposta
volte a cada seis meses.

## Enquanto o Conselho de federativas não existe

O `GOVERNANCE.md` do app-casas prevê um **Conselho de federativas** como dono do
núcleo travado (decisão D21). Esse conselho **ainda não existe**. Até que exista:

- o **COFEMG** exerce o papel de nível 2 descrito acima, limitado ao que a UEM pode
  decidir por si;
- decisões que afetariam outras federativas são tomadas de forma **reversível e
  declaradamente provisória**, e ficam registradas como tais no ADR;
- nenhuma decisão da UEM é apresentada publicamente como decisão do movimento
  espírita brasileiro ou da FEB.

Quando o Conselho for constituído, ele assume o nível 2 para o que for de alcance
nacional, e o COFEMG permanece decidindo o que é de Minas Gerais.

## Urgência

Falha de segurança em produção, vazamento de dado pessoal ou exposição indevida de
conteúdo podem ser corrigidos **imediatamente** pela ACSE, sem processo prévio,
inclusive quando a correção toca um dos cinco critérios. A regra é: **contenha
primeiro, registre em até 48 horas, leve ao COFEMG na primeira oportunidade.**
Ver [SECURITY.md](SECURITY.md).

## Onde as decisões ficam

| Tipo | Onde | Formato |
| :--- | :--- | :--- |
| Decisão de arquitetura | `docs/04-arquitetura/adr/` do repositório afetado | [modelo de ADR](modelos/adr.md) |
| Proposta em discussão | issue do repositório, rótulo `rfc` | [modelo de RFC](modelos/rfc.md) |
| Regra que varia por federativa | `docs/regras/` | [convenção de regras](convencao-de-regras.md) |
| Decisão de produto do app-casas | `spec/11-decisoes.md` (convenção D/A/P já em uso) | tabela existente |
| Decisão sobre a ontologia | `docs/decisoes/` da ontologia | ADR numerado |
