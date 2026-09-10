#!/usr/bin/env bash
#
# Symlink every skill in this repo into Claude Code and Codex.
#
# A "skill" is any top-level directory containing a SKILL.md. Correct links are
# left untouched; links to removed skills in this repo are cleaned up.

set -euo pipefail

REPO="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
TARGETS=("$HOME/.claude/skills" "$HOME/.codex/skills")

for base in "${TARGETS[@]}"; do
  mkdir -p "$base"

  for link in "$base"/*; do
    [ -L "$link" ] || continue
    src="$(readlink "$link")"

    # Only remove links owned by this repo, preserving other installed skills.
    if [ "$src" = "$REPO/$(basename "$link")" ] && [ ! -f "$src/SKILL.md" ]; then
      rm "$link"
      echo "removed obsolete link: $link"
    fi
  done
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
