#!/usr/bin/env bash
set -euo pipefail

# Compare loops between an SV-deletion sample and its matched control.
JUICER_TOOLS_JAR="${JUICER_TOOLS_JAR:?Set JUICER_TOOLS_JAR to juicer_tools.jar}"
SV_HIC="${SV_HIC:?Set SV_HIC to the SV-deletion .hic file}"
CTRL_HIC="${CTRL_HIC:?Set CTRL_HIC to the matched control .hic file}"
SV_LOOPS="${SV_LOOPS:?Set SV_LOOPS to the SV sample merged-loop BEDPE file}"
CTRL_LOOPS="${CTRL_LOOPS:?Set CTRL_LOOPS to the control merged-loop BEDPE file}"
OUT_DIR="${OUT_DIR:-hiccupsdiff_results}"

mkdir -p "$OUT_DIR"
java -jar "$JUICER_TOOLS_JAR" hiccupsdiff -k VC \
  "$SV_HIC" "$CTRL_HIC" "$SV_LOOPS" "$CTRL_LOOPS" "$OUT_DIR"
