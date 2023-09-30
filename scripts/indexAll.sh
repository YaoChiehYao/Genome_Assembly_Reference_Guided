#!/usr/bin/env bash
# indexAll.sh
# Usage: bash scripts/indexAll.sh 1>results/logs/indexAll.index.log 2>results/logs/indexAll.index.err &


# Initialize variable to contain the directory of bamfiles 
bamFilePath="results/bamfiles/"
# Initialize variable to contain the suffix for the bamfiles
bamFileSuffix=".sorted.bam"

# trimAll will loop through all files and trim them
function indexAll {
    # Loop through all the left-read fastq files in $fastqPath
    for leftInFile in $bamFilePath*$bamFileSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$bamFilePath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$bamFileSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        samtools index $bamFilePath$sampleName$bamFileSuffix 
    done
}
indexAll
