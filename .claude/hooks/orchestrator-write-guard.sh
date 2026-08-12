#!/bin/bash
# Оркестратор пишет только координационные файлы, не реализацию задач.
# Поле file_path — стандартное имя для Write/Edit; если хук не срабатывает
# в твоей версии Claude Code, проверь реальное имя поля через /hooks или
# claude --debug и поправь jq-путь ниже.

INPUT=$(cat)
FILE_PATH=$(echo "$INPUT" | jq -r '.tool_input.file_path // .tool_input.path // empty')
[ -z "$FILE_PATH" ] && exit 0

case "$FILE_PATH" in
  */state/*|*/output/*|*/.claude/agents/*|*/.claude/hooks/*|*CLAUDE.md|*README.md|*/.gitignore)
    exit 0 ;;
  *)
    echo "Blocked: оркестратор не пишет файлы реализации напрямую ($FILE_PATH). Делегируй рабочему агенту." >&2
    exit 2 ;;
esac
