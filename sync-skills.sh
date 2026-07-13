#!/usr/bin/env bash
#
# Symlink every skill in this repo into Claude Code and Codex.
#
# A "skill" is any top-level directory containing a SKILL.md. Existing links are
# left untouched, so this is safe to run repeatedly (e.g. after `git pull`).

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGETS=("$HOME/.claude/skills" "$HOME/.codex/skills")

for base in "${TARGETS[@]}"; do
  mkdir -p "$base"
done

for dir in "$REPO"/*/; do
  [ -f "$dir/SKILL.md" ] || continue
  name="$(basename "$dir")"
  src="${dir%/}"

  for base in "${TARGETS[@]}"; do
    link="$base/$name"

    # Already correctly linked -> nothing to do.
    if [ -L "$link" ] && [ "$(readlink "$link")" = "$src" ]; then
      continue
    fi

    # Replace a stale/broken symlink that points elsewhere.
    if [ -L "$link" ]; then
      echo "updating stale link: $link"
      rm "$link"
    elif [ -e "$link" ]; then
      echo "skipping (real file/dir exists, not a symlink): $link"
      continue
    fi

    ln -s "$src" "$link"
    echo "linked: $link -> $src"
  done
done
