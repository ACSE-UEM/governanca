# Política de segurança

Como reportar uma falha, o que fazemos ao receber, e como tratamos incidente com dado
pessoal. Vale para os quatro repositórios do ecossistema.

## Como reportar uma vulnerabilidade

**Não abra issue pública** para falha de segurança. Uma issue expõe o problema a
quem quiser explorá-lo antes da correção.

Use, nesta ordem:

1. **GitHub Security Advisories** — na aba *Security* do repositório, "Report a
   vulnerability". É o caminho preferido: privado, rastreável e integrado à correção.
2. **E-mail** para `seguranca@<dominio-a-definir>`, a ser publicado com o primeiro
   lançamento.
3. Se o relato envolver quem mantém o projeto, escreva à coordenação da Área de
   Comunicação Social Espírita pelos canais institucionais da União Espírita Mineira.

Inclua, se possível: o que observou, como reproduzir, o impacto que imagina, e se
chegou a acessar dado real. Um relato imperfeito é muito melhor que nenhum relato.

## Nosso compromisso

| Etapa | Prazo-alvo |
| :--- | :--- |
| Confirmação de recebimento | 5 dias corridos |
| Avaliação inicial e classificação | 15 dias corridos |
| Correção de falha crítica | 30 dias corridos |
| Correção de falha não crítica | próximo ciclo de entrega |
| Publicação do aviso, após corrigido | junto com a correção |

Quem reporta de boa-fé recebe crédito público, se desejar, e nunca sofre retaliação.
Não haverá medida legal nem administrativa contra pesquisa de segurança responsável
que respeite as regras abaixo.

## Pesquisa responsável — o que pedimos

- Não acesse, copie, altere nem retenha dado pessoal de terceiro. Se esbarrar em dado
  real, **pare**, não guarde cópia, e relate o que viu sem reproduzir o conteúdo.
- Não degrade o serviço: nada de teste de negação de serviço nem de carga.
- Não use engenharia social contra voluntários, dirigentes ou usuários.
- Dê tempo para a correção antes de divulgar publicamente.

## Incidente com dado pessoal

Procedimento obrigatório, conduzido pelo Encarregado com apoio da coordenação da
ACSE:

1. **Conter.** Interromper a exposição imediatamente — retirar do ar, revogar chave,
   bloquear acesso. Contenção precede análise e não espera autorização.
2. **Preservar.** Guardar registros e evidências antes de qualquer limpeza.
3. **Avaliar** o risco às pessoas afetadas: que dado, quantas pessoas, por quanto
   tempo, quem pode ter acessado.
4. **Comunicar** à ANPD e às pessoas afetadas nos prazos regulamentares, em
   linguagem clara, dizendo o que houve e o que a pessoa pode fazer.
5. **Corrigir** a causa, e não apenas o sintoma.
6. **Registrar** o incidente e o que mudou para não repetir.

A correção emergencial é autorizada sem processo prévio de decisão, conforme a seção
de urgência do [processo de decisão](processo-de-decisao.md): **contenha primeiro,
registre em até 48 horas, leve ao COFEMG na primeira oportunidade.**

## Dado pessoal commitado por engano

Este é o incidente mais provável do ecossistema, porque os repositórios são públicos
e a equipe manipula extratos reais de cadastro.

**Apagar o arquivo num commit seguinte não resolve.** O conteúdo permanece no
histórico do git e nos clones e forks que já existirem.

Procedimento:

1. Tratar como incidente de dado pessoal, com todos os passos acima.
2. Tornar o repositório privado, se o volume exposto justificar.
3. Reescrever o histórico (`git filter-repo`) e forçar a atualização.
4. **Considerar comprometido** todo segredo exposto e rotacioná-lo: chave de API,
   token, senha. Reescrever o histórico não desfaz a exposição.
5. Avisar quem tem fork, pois o histórico deles não é reescrito automaticamente.
6. Revisar por que a guarda automática não pegou, e corrigir a guarda.

## Prevenção obrigatória

Todo repositório do ecossistema mantém:

- `.gitignore` cobrindo os diretórios de dados brutos e de credenciais;
- **guarda de PII** em `pre-commit` e em integração contínua, que recusa arquivo com
  coluna ou padrão de dado pessoal — ver [scripts/guarda-pii.sh](scripts/guarda-pii.sh);
- **varredura de segredos** (`gitleaks`) em integração contínua;
- credenciais fora do repositório, lidas de variável de ambiente ou de arquivo
  ignorado;
- revisão obrigatória de Pull Request antes da integração.

## Fora de escopo

Não são tratadas como vulnerabilidade deste projeto: falhas em serviços de terceiros
(hospedagem, provedores de dados públicos), ausência de proteções que não afetam o
risco real, e relatos automatizados sem demonstração de impacto.
