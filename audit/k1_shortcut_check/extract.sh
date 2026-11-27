#!/bin/sh
# Copy the modules listed in a manifest out of an unpacked copy of the archive.
# Usage: extract.sh <archive>/lean/src <manifest.txt> <destination-dir>
# The archive itself is not redistributed here; get it from https://alpo.ge/remark.pdf (footnote 1).
set -eu
src=$1; manifest=$2; dst=$3
while read -r m; do
  f=$(printf '%s' "$m" | tr . /).lean
  mkdir -p "$dst/$(dirname "$f")"
  cp "$src/$f" "$dst/$f"
done < "$manifest"
