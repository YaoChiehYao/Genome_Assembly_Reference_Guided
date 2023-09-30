#!/usr/bin/env bash
# trimAll.sh
# Usage: bash scripts/trimAll.sh 1>results/logs/trimAll.log 2>results/logs/trimAll.err &

# Initialize variable to contain the directory of un-trimmed fastq files 
fastqPath="data/rawreads/"

# Initialize variable to contain the suffix for the left reads
leftSuffix=".R1.fastq"
rightSuffix=".R2.fastq"
pairedOutPath="data/trimmed/paired/"
unpairedOutPath="data/trimmed/unpaired/"

# path to the Trimmomatic program folder within our environment that contains the Illumina adapters
# this is only for Discovery - local systems will typically have a path like: /usr/local/programs/Trimmomatic-0.39-2/
PATH_TO_TRIMMOMATIC="/shared/centos7/anaconda3/2021.11/envs/BINF-12-2021/pkgs/trimmomatic-0.39-hdfd78af_2/share/trimmomatic-0.39-2"

# Create needed folders
mkdir -p $pairedOutPath $unpairedOutPath

# trimAll will loop through all files and trim them
function trimAll {
    # Loop through all the left-read fastq files in $fastqPath
    for leftInFile in $fastqPath*$leftSuffix
    do
        # Remove the path from the filename and assign to pathRemoved
        pathRemoved="${leftInFile/$fastqPath/}"
        # Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
        sampleName="${pathRemoved/$leftSuffix/}"
        # Print $sampleName to see what it contains after removing the path
        echo $sampleName
        trimmomatic PE \
        -threads 1 -phred33 \
        $fastqPath$sampleName$leftSuffix \
        $fastqPath$sampleName$rightSuffix \
        $pairedOutPath$sampleName$leftSuffix \
        $unpairedOutPath$sampleName$leftSuffix \
        $pairedOutPath$sampleName$rightSuffix \
        $unpairedOutPath$sampleName$rightSuffix \
        HEADCROP:0 \
        ILLUMINACLIP:$PATH_TO_TRIMMOMATIC/adapters/TruSeq3-PE.fa:2:30:10 \
        LEADING:20 TRAILING:20 SLIDINGWINDOW:4:30 MINLEN:36
    done
}
trimAll
