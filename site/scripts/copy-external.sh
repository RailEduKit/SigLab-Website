#!/usr/bin/env bash
set -euo pipefail

MANIFEST="${1:?usage: copy-external.sh <manifest.tsv> <out_dir>}"
OUT="${2:?usage: copy-external.sh <manifest.tsv> <out_dir>}"
ROOT="${SIBLINGS_ROOT:-..}"
INDEX="${OUT}/external-downloads-index.md"

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

mkdir -p "${OUT}"
{
  echo "## External artifact inventory"
  echo
} > "${INDEX}"

while IFS=$'\t' read -r dst src required; do
  [[ -z "${dst}" || "${dst}" =~ ^# ]] && continue
  required="${required:-yes}"
  src_abs="$(resolve_src "${src}")"
  dst_abs="${OUT}/${dst}"
  mkdir -p "$(dirname "${dst_abs}")"

  if [[ -f "${src_abs}" ]]; then
    if [[ ! -f "${dst_abs}" || "${src_abs}" -nt "${dst_abs}" ]]; then
      cp "${src_abs}" "${dst_abs}"
    fi
    if [[ "${dst}" == downloads/* ]]; then
      printf -- '- [%s](/%s)\n' "$(basename "${dst}")" "${dst}" >> "${INDEX}"
    fi
  else
    if [[ "${required}" == "yes" ]]; then
      printf 'missing required external artifact: %s\n' "${src_abs}" >&2
      exit 1
    fi
  fi
done < "${MANIFEST}"
