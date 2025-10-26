#!/usr/bin/env bash

# This script performs backup and rotation using bash.
#
# Features:
# - Backs up specified directory to ZIP (with timestamp)
# - Rotates old backups (keeps the latest N files)
# - Excludes system files (.DS_Store, Thumbs.db, etc.)
# - Verifies ZIP integrity
#
# Usage:
#   ./bkup.sh <SOURCE_DIR> [DEST_DIR=./backups] [KEEP=10]
#
# Parameters:
#   SOURCE_DIR: Source directory to backup (required)
#   DEST_DIR: Destination directory (default: ./backups)
#   KEEP: Number of old backups to keep (default: 10)
#
# Example: Backup /Users/k2/Documents and keep latest 5 backups
#   ./bkup.sh /Users/k2/Documents ./backups 5

set -euo pipefail

SOURCE_DIR="${1:-}"
DEST_DIR="${2:-./backups}"
KEEP="${3:-10}"

if [[ -z "$SOURCE_DIR" ]]; then
  echo "Usage: $0 <SOURCE_DIR> [DEST_DIR=./backups] [KEEP=10]" >&2
  exit 1
fi

# 絶対パス化
if ! SOURCE_DIR_ABS="$(cd "$SOURCE_DIR" 2>/dev/null && pwd)"; then
  echo "Error: SOURCE_DIR not found: $SOURCE_DIR" >&2
  exit 2
fi
DEST_DIR_ABS="$(cd "$(dirname "$DEST_DIR")" && mkdir -p "$(basename "$DEST_DIR")" && cd "$DEST_DIR" && pwd)"

# タイムスタンプ付きファイル名
TS="$(date +%Y%m%d%H%M)"
BASE="$(basename "$SOURCE_DIR_ABS")"
ZIP_PATH="$DEST_DIR_ABS/${BASE}_${TS}.zip"

echo "Zipping: $SOURCE_DIR_ABS -> $ZIP_PATH"
(
  cd "$(dirname "$SOURCE_DIR_ABS")"
  zip -r -q -y "$ZIP_PATH" "$BASE" \
    -x "*/.DS_Store" "*/Thumbs.db" "*/.~*" "*/.Spotlight-*" "*/.Trash/*"
)

unzip -tq "$ZIP_PATH" >/dev/null
echo "Created: $ZIP_PATH"

# ローテーション処理
if [[ "$KEEP" =~ ^[0-9]+$ ]] && (( KEEP >= 0 )); then
  OLD_FILES=($(ls -1t "$DEST_DIR_ABS/${BASE}_"*.zip 2>/dev/null || true))
  if (( ${#OLD_FILES[@]} > KEEP )); then
    for f in "${OLD_FILES[@]:KEEP}"; do
      rm -f -- "$f"
    done
  fi
fi
echo "Done."

