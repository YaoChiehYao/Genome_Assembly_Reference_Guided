#!/usr/bin/env bash
# alignAll.sh
# Usage: bash scripts/alignAll.sh 1>results/logs/alignAll.log 2>results/logs/alignAll.err &

# Initialize variable to contain the directory of un-trimmed fastq files 
fastqPath="data/trimmed/paired/"

# Initialize variable to contain the suffix for the left reads
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
samfileSuffix=".sam"
samFilePath="results/samfiles/"
# Create needed folders
mkdir -p "results/samfiles" 

# trimAll will loop through all files and trim them
function alignAll {
    # Loop through all the left-read fastq files in $fastqPath
    for leftInFile in $fastqPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$fastqPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        gsnap \
        -A sam \
        -D data \
        -d AiptasiaGmapDb \
        -N 1 \
        $fastqPath$sampleName$leftSuffix \
        $fastqPath$sampleName$rightSuffix \
        1> $samFilePath$sampleName$samfileSuffix  
    done
}
alignAll
