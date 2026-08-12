#!/bin/bash
# qa-reviewer только читает и проверяет. Блокирует Bash-команды, которые
# могут менять файлы в обход отсутствующих у него Write/Edit.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$COMMAND" ] && exit 0

if echo "$COMMAND" | grep -qE '(^|[[:space:]])(sed[[:space:]]+-i|perl[[:space:]]+-i|rm|mv|cp|chmod|chown|touch|mkdir|tee)([[:space:]]|$)' \
  || echo "$COMMAND" | grep -qE 'git[[:space:]]+(add|commit|push|checkout|reset|stash|rm|mv|apply)' \
  || echo "$COMMAND" | grep -qE '>>?[[:space:]]*[^&[:space:]]'; then
  echo "Blocked: qa-reviewer — только чтение и проверка. Команда похожа на запись файлов." >&2
  exit 2
fi

exit 0
