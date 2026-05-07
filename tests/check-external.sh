#!/usr/bin/env bash
set -euo pipefail

MANIFEST="${1:?usage: check-external.sh <manifest.tsv>}"
ROOT="${SIBLINGS_ROOT:-..}"
failed=0

resolve_src() {
  local src="$1"
  local candidate="${ROOT}/${src}"
  if [[ -f "${candidate}" ]]; then
    printf '%s\n' "${candidate}"
    return
  fi

  local alt="${src}"
  alt="${alt/SigLab-3Dmodels/3d-models}"
  alt="${alt/SigLab-handouts/handbook}"
  alt="${alt/SigLab-Papercut/papercut}"
  printf '%s\n' "${ROOT}/${alt}"
}

while IFS=$'\t' read -r dst src required; do
  [[ -z "${dst}" || "${dst}" =~ ^# ]] && continue
  required="${required:-yes}"
  abs="$(resolve_src "${src}")"
  if [[ -f "${abs}" ]]; then
    printf '[OK] %s <- %s\n' "${dst}" "${src}"
  else
    if [[ "${required}" == "yes" ]]; then
      printf '[FAIL] %s\n' "${dst}"
      printf '  expected: %s/%s\n' "${ROOT}" "${src}"
      printf '  hint: verify sibling repo path or artifact name\n'
      failed=1
    else
      printf '[WARN] optional missing %s <- %s\n' "${dst}" "${src}"
    fi
  fi
done < "${MANIFEST}"

exit "${failed}"
