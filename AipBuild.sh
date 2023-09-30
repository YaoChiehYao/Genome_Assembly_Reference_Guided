#!/usr/bin/env bash
# AipBuild.sh
# Usage: bash scripts/AipBuild.sh 1>results/logs/AipBuild.log 2>results/logs/AipBuild.err &

gmap_build -D data \
-d AiptasiaGmapDb \
/work/courses/BINF6308/AiptasiaMiSeq/\
GCA_001417965.1_Aiptasia_genome_1.1_genomic.fna
