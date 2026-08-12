---
name: start-project
description: Запускает новый проект — разбор материалов из inbox/<slug>, план задач и агентов, затем делегирование и цикл проверки.
disable-model-invocation: true
argument-hint: [slug]
---

Проект: $ARGUMENTS

1. Вызови скилл intake для inbox/$ARGUMENTS — получи state/$ARGUMENTS/brief.md
   и state/$ARGUMENTS/status.md.
2. Коротко покажи пользователю план (список задач и исполнителей) на здравый смысл.
3. После подтверждения — делегируй задачи и веди цикл dispatch → verify-task →
   доработка, пока каждая задача не станет verified или needs-human. После
   каждой verified-задачи — git-коммит (см. пункт 11 в orchestrator.md).
4. Вызови скилл final-report.
