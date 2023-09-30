#!/usr/bin/env bash
# listSamples.sh
# Usage: bash scripts/listSamples.sh

#Initialize variable to contain the directory of un-trimmed fastq files 
fastqPath="data/rawreads/"
#Initialize variable to contain the suffix for the left reads
leftSuffix=".R1.fastq"
#Loop through all the left-read fastq files in $fastqPath
for leftInFile in $fastqPath*$leftSuffix
do
    #Remove the path from the filename and assign to pathRemoved
    pathRemoved="${leftInFile/$fastqPath/}"
    #Remove the left-read suffix from $pathRemoved and assign to suffixRemoved
    sampleName="${pathRemoved/$leftSuffix/}"
    #Print $sampleName to see what it contains after removing the path
    echo $sampleName
done
