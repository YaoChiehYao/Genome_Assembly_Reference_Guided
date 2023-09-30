#!/usr/bin/env bash
# sortAlign.sh
# Usage: bash scripts/sortAlign.sh 1>results/logs/Aip02.sort.log 2>results/logs/Aip02.sort.err &

samtools sort \
results/Aip02.sam \
-o results/Aip02.sorted.bam \
