
BINF 6308 Assignment7

# Project name: Reference-guided assembly
The project demos the reference-guided assembly process by 
using third-party modules such as trimmomatic, gmap,
gsnap, and samtools, and in the end, bam and indexed bam files
(.bai) generated as a wrap-up. A Bam file is a compressed sam
file; most algorithms support bam files and the genome browser
nowadays.  


## Description

This reference-guided assembly uses NGS data from discovery;
the assembled target is an Aiptasia, and the genome data is
derived from the Illumina MiSeq machine. We will follow the
steps to finish our task. 
1. Querying raw data
2. Trimming and Filtering data 
3. Build Database for alignment 
4. Assembling sequence to sam files
5. Sort and index sam to bam files


Ultimately, we can use the IGV genome browser to read the assembled
outcome from bam files. Because the reference-guided approach uses
validated chromosomes or complete sequences for alignment, we can
visually check our assembly outcome on it. 


## Getting Started

* Hi, this is the documentation for assignment 7 of the bio-computational
  method course.
* That's start reference guided assembly project from the beginning, step
  by step, code by code.
* The working environment is under the Command line prompt, such as a Mac
  terminal or Ubuntu (with Bash script), so please prepare it in advance.   


### Dependencies

* Python version 3.8.10 and compatible modules (if needed)
* Trimmomatic 0.39-2
* Gmap
* Gsnap
* Samtools 1.10


### Installing

Install the third-party software above with specific dependencies
(if needed)

### Executing program

* Use the vim editor to prepare bash scripts for the following steps:

  1. Download Aiptasia raw data from the discovery server via the cp command
  2. Trim and Filter the downloaded FASTQ file and separate it into paired and unpaired files
  3. Build a Genome database for reference-guided assembly 
  4. Use gsnap to assemble paired data
  5. Apply samtools to sort and index the sam files into bam files 

* In the end, make all scripts into one via the pipeline


  Here is the link of file: 
```
https://github.com/NU-Bioinformatics/module-06-YaoChiehYao.git
```

## Method

This reference-guided assembly project use third-party packages, including trimmomatic,gmap,gsnap,
and samtools for assembling the targeted Aiptasia genome sequences. The trimmomatic method pairs
the sequence data from the MiSeq platform of Illumina( length is typically 2 × 300 bp) and saves
into paired.fasta files. The Gmap package builds a referential database to use in the alignment
process. The Gsnap uses paired read and map to referenced gmap database, which has the built-in
GFF3 file for guiding the map location and export to sam files. Finally, we use samtools to sort
and give indexes of sam files and save them into bam files and indexed bam files (.bai).
Here is the using parameter of each method:

* Trimmomatic
  A software works for single-end and pair-end sequence data to trim Illumina FASTQ files, remove adaptors,
  and filter data for assembly.
  
  - The PE and SE parameter indicates the FASTQ data is pair-end or single-end. 
  - The phred 33 / phred 64 are the quality score converter 
  - The threads show how many server threads for running in this job
  - HEADCROP indicates how many bases should be removed from the beginning of the sequence (trim the primer/ adaptor)
  - ILLUMINACLIP cuts adaptor and other Illumina-specified sequences from the read
  - SLIDINGWINSODE performs a sliding window trimming approach. It starts scanning from the 5' end and clips the reads once the average quality within the window falls below a threshold
  - MINLEN drops the minimum reads if it is less than a specified length
   
* Gmap
  A tool to build a GMAP database to assemble the targeted genome. The GMAP DB is indexed and allows the algorithm to find the starting alignment points faster than iterating through all the files. 
  
  The script takes parameters as followed:
  - D Where to build the gmap database 
  - d The name of the database 
  - The location where to find the reference guide genome in the fasta file (.fna)

* Gsnap
  A reference guide genome assembly tool to align paired sequence data base on the
  gmap database, and output as sam files. The parameters are: 

  - A is the output format (default is .sam) 
  - D is the genome directory
  - d is the genome database
  - N look for novel splicing (0=no,1=yes)
  - 1> is the output path

* Samtools
  Samtools is a software to utilize the aligned sequence in SAM format via sort and index commands to arrange the assembly results into bam files(binary version of sam file) and give indexing to the bam as a bam.bai (bam indexing file) for further use.  

  Sort commands parameters: 
  - input path of sam files
  - output path of bam files 
  
  Index command parameters:
  The index commands take simply the sorted bam file from the sorting
  step as an import parameter and index it to bam.bai format.

   
   
## Citations

  1. Trimmomatic package citation:
  Bolger, A. M., Lohse, M., & Usadel, B. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics, 30(15), 2114–2120. https://doi.org/10.1093/bioinformatics/btu170

  2. Samtools packahe citation:
  Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., & Durbin, R. (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25(16), 2078–2079. https://doi.org/10.1093/bioinformatics/btp352

  3. Gmap package citation
  Wu, T. D., & Watanabe, C. K. (2005). GMAP: a genomic mapping and alignment program for mRNA and EST sequences. Bioinformatics, 21(9), 1859–1875. https://doi.org/10.1093/bioinformatics/bti310

  4. Gsnap package citation
  Wu, T. D., & Nacu, S. (2010). Fast and SNP-tolerant detection of complex variants and splicing in short reads. Bioinformatics, 26(7), 873–881. https://doi.org/10.1093/bioinformatics/btq057



## Help

Any other issue contact with yao.yao-@northeastern.edu


## Authors

Yao Chieh Yao
Northeastern University Bioinformatics


## Version History

* 1.0
    * Assignment01 Finish 
* 0.1
    * Assignment01 Release 


## License

This project is an assignment work and only license to TA and professors of Northeastern University Bioinformatics 


## Acknowledgments

