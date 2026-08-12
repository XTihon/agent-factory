#!/bin/bash
# Оркестратор координирует, а не собирает/тестирует/пишет код сам.

INPUT=$(cat)
COMMAND=$(echo "$INPUT" | jq -r '.tool_input.command // empty')
[ -z "$COMMAND" ] && exit 0

if echo "$COMMAND" | grep -qE '\b(npm|yarn|pnpm|python3?|node|go|cargo|make|pytest|jest|ruby|php|rustc|gcc|g\+\+)\b' \
  || echo "$COMMAND" | grep -qE 'sed[[:space:]]+-i'; then
  echo "Blocked: похоже на прямой запуск сборки/тестов/реализации — это задача builder или qa-reviewer, не оркестратора." >&2
  exit 2
fi

exit 0
