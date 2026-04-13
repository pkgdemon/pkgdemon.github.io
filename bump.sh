#!/usr/bin/env bash
# Bumps ?v=YYYYMMDD cache-busting stamps on guide links in index.html to today's date.
set -euo pipefail

cd "$(dirname "$0")"

STAMP=$(date +%Y%m%d)

# Replace any ?v=<8 digits> occurrence with today's stamp.
if [[ "$(uname)" == "Darwin" ]]; then
  sed -i '' -E "s/\?v=[0-9]{8}/?v=${STAMP}/g" index.html
else
  sed -i -E "s/\?v=[0-9]{8}/?v=${STAMP}/g" index.html
fi

echo "Bumped cache stamps in index.html to v=${STAMP}"
