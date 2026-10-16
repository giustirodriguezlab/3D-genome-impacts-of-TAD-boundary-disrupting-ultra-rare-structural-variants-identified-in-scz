#!/usr/bin/env bash
set -euo pipefail

# Calculate insulation scores and call boundaries using FAN-C.
HIC_FILE="${HIC_FILE:?Set HIC_FILE to the input .hic file}"
OUT_DIR="${OUT_DIR:-fanc_insulation}"
RESOLUTION="${RESOLUTION:-50000}"
WINDOWS="${WINDOWS:-150000}"
MIN_SCORE="${MIN_SCORE:-0.7}"

mkdir -p "$OUT_DIR"
RES_KB=$((RESOLUTION / 1000))
HIC_AT_RES="${HIC_FILE}@${RES_KB}kb"

fanc insulation "$HIC_AT_RES" "${OUT_DIR}/insulation_${RES_KB}kb.tsv" -w "$WINDOWS"
fanc boundaries "${OUT_DIR}/insulation_${RES_KB}kb.tsv" \
  "${OUT_DIR}/boundaries_${RES_KB}kb.bed" -w "$WINDOWS" --min-score "$MIN_SCORE"
