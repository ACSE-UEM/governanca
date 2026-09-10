# Política de proteção de dados pessoais

Regras de tratamento de dados pessoais comuns aos quatro projetos. Cada repositório
detalha o que trata no seu próprio `docs/02-conformidade/inventario-de-dados.md`;
nenhum deles pode contrariar o que está aqui.

Base legal aplicável: **Lei 13.709/2018 (LGPD)** e, para menores, a **Lei 8.069/1990
(Estatuto da Criança e do Adolescente)**. Nenhuma regra de projeto, decisão de
produto ou preferência de federativa se sobrepõe a elas.

## 1. O dado mais sensível que tratamos

O vínculo de uma pessoa a uma casa espírita **revela convicção religiosa**, e por
isso é **dado pessoal sensível** (LGPD, art. 5º, II), com tratamento restrito pelo
art. 11. Isso vale para o voluntário, o coordenador, o dirigente e o candidato a
voluntário.

Consequências que valem em todos os projetos, sem exceção:

- vínculo pessoa ↔ casa é tratado sob **consentimento específico e destacado**,
  nunca sob legítimo interesse;
- vínculo **nunca** aparece em API pública, exportação, painel demográfico, arquivo
  de dados abertos ou resposta de assistente de IA;
- a plataforma **não registra** quem frequenta, quem foi atendido, ou quem recebeu
  amparo. Dados de **pessoas atendidas não são coletados** — é anti-requisito, não
  funcionalidade adiada.

## 2. Papéis

| Papel | Quem | Situação |
| :--- | :--- | :--- |
| Controlador | União Espírita Mineira (UEM) | **a formalizar** — ver minuta de endosso |
| Encarregado (DPO) | a nomear pela UEM | **não nomeado** |
| Operadores | fornecedores de hospedagem e serviços contratados | a contratar com cláusula de proteção de dados |
| Controladores conjuntos | federativas adotantes, conforme acordo de adoção | a definir no acordo |

> **Pendência crítica.** Enquanto a UEM não formalizar o endosso e nomear o
> Encarregado, os projetos operam sem controlador declarado. Nenhum produto pode ser
> lançado ao público nessa condição. Ver
> [minutas/termo-de-endosso-uem.md](minutas/termo-de-endosso-uem.md).

## 3. Minimização — a regra que decide as outras

**Não colete o que você não precisa; não guarde o que já usou; não mostre o que não
precisa ser visto.**

Antes de criar qualquer campo que contenha dado de pessoa, responda por escrito no
inventário do repositório:

1. Para que serve? (finalidade específica, não "pode ser útil")
2. Qual a base legal?
3. Quem enxerga?
4. Por quanto tempo fica?
5. O que acontece quando o titular pede exclusão?

Campo sem as cinco respostas não entra em produção.

## 4. Menores de idade

Regra única para todos os projetos com conta de pessoa:

- **Conta a partir de 16 anos**, com **consentimento verificável do responsável
  legal**, registrado e auditável.
- **Menores de 16 anos não têm conta.** Atividades de infância e juventude existem
  como informação pública de agenda; inscrição de criança acontece presencialmente
  na casa, fora da plataforma.
- Usuários de 16 e 17 anos **nunca** aparecem em página pública nem em contato
  público de atividade. Candidaturas suas são sinalizadas como de menor.
- Pedido de exclusão de dado de menor tem **prioridade máxima** na fila.

## 5. Retenção

Nenhum dado pessoal é guardado por prazo indeterminado. Prazos-padrão do ecossistema,
que cada projeto pode encurtar mas não estender sem decisão de nível 2:

| Conjunto | Prazo |
| :--- | :--- |
| Conta de usuário | enquanto a conta existir; exclusão a pedido |
| Contato de administrador de cadastro | enquanto exercer a função + 1 ano |
| Candidatura a voluntariado | anonimização automática 6 meses após a decisão |
| Registro de consentimento | duração do vínculo + 5 anos |
| Denúncia | resolução + 1 ano |
| Documento de disputa de posse de cadastro | desfecho + 90 dias, depois excluído |
| Registro de auditoria | 5 anos |
| Inscrição de notificação (push) | até revogação, saída ou expiração |

## 6. Direitos do titular

Prazo-alvo de resposta: **15 dias corridos**, para qualquer um dos direitos.

- **Confirmação e acesso** ao que é tratado sobre a pessoa.
- **Correção** de dado incompleto ou desatualizado.
- **Anonimização, bloqueio ou eliminação** de dado desnecessário ou tratado em
  desconformidade.
- **Portabilidade** em formato estruturado e legível por máquina.
- **Revogação de consentimento**, a qualquer tempo, com efeito imediato.
- **Informação sobre compartilhamento** com quem os dados foram compartilhados.
- **Oposição** a tratamento fundado em hipótese que dispense consentimento.

**Arbitragem.** Quando uma casa recusar excluir dado que o titular alega ser seu,
decide o Encarregado. Dado institucional da casa (nome, endereço, agenda) **não é**
dado pessoal do solicitante e não se exclui por esse caminho.

## 7. Agregação estatística

Todo número publicado em painel, relatório ou resposta de IA respeita
**k-anonimato com k ≥ 5**: nenhuma célula com menos de cinco indivíduos ou cinco
casas é exibida. Em município pequeno, "3 espíritas na atividade X" identifica
pessoas, mesmo sem citar nomes.

Células suprimidas aparecem como "dado suprimido para proteger a privacidade", e
nunca como zero ou como célula vazia — o leitor precisa saber que existe dado ali.

## 8. Dados em repositório

**Nenhum arquivo com dado pessoal entra em repositório**, público ou privado. Isso
inclui extratos de sistemas legados, planilhas de contato, exportações de teste e
capturas de tela com nome ou telefone visível.

Medidas obrigatórias em todo repositório que manipule dados:

1. `.gitignore` cobrindo os diretórios de dados brutos;
2. guarda automática de PII em `pre-commit` e em integração contínua, que recusa a
   inclusão de arquivo com coluna ou padrão proibido — ver
   [scripts/guarda-pii.sh](scripts/guarda-pii.sh);
3. dado real fora do repositório, em caminho apontado por variável de ambiente;
4. no repositório, apenas o **esquema** e um **exemplo fictício** de poucas linhas.

Se um dado pessoal for commitado por engano, o procedimento é o de incidente:
ver [SECURITY.md](SECURITY.md). Remover o arquivo num commit seguinte **não resolve**
— o dado permanece no histórico.

## 9. Inteligência artificial

- Assistentes e buscas semânticas respondem **apenas** sobre dado cadastrado e
  público. Nunca sobre dado pessoal, nunca sobre vínculo religioso.
- Nenhuma inferência sobre pessoas: o sistema não deduz religião, condição social,
  vulnerabilidade nem qualquer característica de indivíduo.
- Toda saída de IA que informe decisão passa por **revisão humana** antes do uso,
  com o resultado da revisão registrado.
- Dado pessoal **nunca** é enviado a serviço de IA de terceiro.

## 10. Incidentes

Contenção imediata, avaliação de risco ao titular, comunicação à ANPD e às pessoas
afetadas nos prazos regulamentares, e registro do que aconteceu e do que mudou para
não repetir. Procedimento em [SECURITY.md](SECURITY.md).
