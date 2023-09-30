#!/usr/bin/env bash
# sortAll.sh
# Usage: bash scripts/sortAll.sh 1>results/logs/sortAll.sort.log 2>results/logs/sortAll.sort.err &


# Initialize variable to contain the directory of samfiles 
samFilePath="results/samfiles/"
bamFilePath="results/bamfiles/"
# Initialize variable to contain the suffix for the samfiles
samFileSuffix=".sam"
bamFileSuffix=".sorted.bam"
# Create needed folders
mkdir -p "results/bamfiles" 

# trimAll will loop through all files and trim them
function sortAll {
    # Loop through all the left-read fastq files in $fastqPath
    for leftInFile in $samFilePath*$samFileSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$samFilePath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$samFileSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        samtools sort \
        $samFilePath$sampleName$samFileSuffix \
        -o $bamFilePath$sampleName$bamFileSuffix  
    done
}
sortAll
