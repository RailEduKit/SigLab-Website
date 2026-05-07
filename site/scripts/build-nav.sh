#!/usr/bin/env bash
set -euo pipefail

SUMMARY_FILE="${1:?usage: build-nav.sh <summary.md> <build_dir>}"
BUILD_DIR="${2:?usage: build-nav.sh <summary.md> <build_dir>}"
PREVNEXT_DIR="${BUILD_DIR}/prevnext"
SIDEBAR_FILE="${BUILD_DIR}/sidebar.html"

mkdir -p "${BUILD_DIR}" "${PREVNEXT_DIR}"

entries=()
while IFS= read -r line; do
  trimmed="${line}"
  indent=0
  while [[ "${trimmed}" == "  "* ]]; do
    indent=$((indent + 1))
    trimmed="${trimmed#  }"
  done

  if [[ "${trimmed}" == "- ["*"]("*")" ]]; then
    body="${trimmed#- [}"
    title="${body%%](*}"
    path="${body#*](}"
    path="${path%)}"
    entries+=("${indent}"$'\t'"${title}"$'\t'"${path}")
  fi
done < "${SUMMARY_FILE}"

{
  echo "<ul>"
  for entry in "${entries[@]}"; do
    IFS=$'\t' read -r indent title path <<< "${entry}"
    url="/${path%.md}.html"
    printf '  <li class="level-%s"><a href="%s">%s</a></li>\n' "${indent}" "${url}" "${title}"
  done
  echo "</ul>"
} > "${SIDEBAR_FILE}"

total="${#entries[@]}"
for i in "${!entries[@]}"; do
  IFS=$'\t' read -r _ title path <<< "${entries[$i]}"
  base="${path%.md}"
  out="${PREVNEXT_DIR}/${base}.yaml"
  mkdir -p "$(dirname "${out}")"

  : > "${out}"
  if (( i > 0 )); then
    IFS=$'\t' read -r __ prev_title prev_path <<< "${entries[$((i-1))]}"
    printf 'prev:\n  title: "%s"\n  url: "/%s.html"\n' "${prev_title}" "${prev_path%.md}" >> "${out}"
  fi
  if (( i + 1 < total )); then
    IFS=$'\t' read -r __ next_title next_path <<< "${entries[$((i+1))]}"
    printf 'next:\n  title: "%s"\n  url: "/%s.html"\n' "${next_title}" "${next_path%.md}" >> "${out}"
  fi
done
