#!/usr/bin/env bash

#!/usr/bin/env bash
set -euo pipefail

# Run Juicer for Hi-C processing
module load juicer/2.0

# Set these paths for your local environment
SAMPLE_DIR="${SAMPLE_DIR:?Set SAMPLE_DIR to the sample working directory}"
JUICER_ACCOUNT="${JUICER_ACCOUNT:?Set JUICER_ACCOUNT}"
GENOME_FASTA="${GENOME_FASTA:?Set GENOME_FASTA to the hg38 FASTA}"
RESTRICTION_SITES="${RESTRICTION_SITES:?Set RESTRICTION_SITES to the Arima site file}"
CHROM_SIZES="${CHROM_SIZES:?Set CHROM_SIZES to the hg38 chromosome sizes file}"

juicer.sh \
  -g hg38 \
  -d "$SAMPLE_DIR" \
  -A "$JUICER_ACCOUNT" \
  -s Arima \
  -b Arima \
  -C 40000000 \
  -z "$GENOME_FASTA" \
  -y "$RESTRICTION_SITES" \
  -p "$CHROM_SIZES"
