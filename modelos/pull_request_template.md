## O que muda

Descreva em uma ou duas frases. Se houver issue ou RFC, referencie.

## Por quê

O problema que isto resolve, do ponto de vista de quem usa.

## Como verificar

Passos para quem revisa confirmar que funciona.

---

## Verificações obrigatórias

- [ ] Documentação em **português brasileiro**.
- [ ] Commits assinados com `Signed-off-by` (DCO) — `git commit -s`.
- [ ] `make lint` sem erros.
- [ ] `make guarda-pii` sem erros.
- [ ] Nenhum dado pessoal real em arquivo, exemplo, teste ou captura de tela.
- [ ] Nenhuma credencial, chave ou token no diff.
- [ ] Vocabulário conforme o [glossário](https://github.com/ACSE-UEM/governanca/blob/main/glossario.md); nenhum termo redefinido.

## Classificação da mudança

- [ ] **Nível 1** — técnica e reversível; decidida pela coordenação da ACSE.
- [ ] **Nível 2** — aciona um dos cinco critérios; exige RFC e decisão do COFEMG.

Se marcou nível 2, indique o critério e o link da RFC:

> Critério: ...
> RFC: ...

## Conformidade

- [ ] **Não toca dado pessoal.**
- [ ] Toca dado pessoal — inventário atualizado e Encarregado consultado.
- [ ] **Não toca conteúdo doutrinário.**
- [ ] Toca conteúdo doutrinário — revisor da área identificado: ...
- [ ] **Não publica dado de terceiro.**
- [ ] Publica dado de terceiro — autorização: ...

## Se toca a ontologia ou o modelo de dados

- [ ] Não toca.
- [ ] Toca **elemento crítico** — exige aprovação explícita do mantenedor do domínio
      e, por ser nível 2, decisão do COFEMG.
- [ ] Perguntas de competência atualizadas e validação completa executada.
