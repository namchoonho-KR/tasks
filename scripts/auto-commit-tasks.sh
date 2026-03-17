#!/bin/bash
# tasks/ 폴더 변경 시 자동 커밋

REPO_ROOT="$(git rev-parse --show-toplevel 2>/dev/null)"
if [ -z "$REPO_ROOT" ]; then exit 0; fi

cd "$REPO_ROOT"

# tasks/ 또는 INDEX.md 변경 여부 확인
if git diff --name-only | grep -qE '^(tasks/|INDEX\.md)'; then
  git add tasks/ INDEX.md
  git commit -m "auto: tasks update $(date '+%Y%m%d-%H%M')"
  git push
fi
