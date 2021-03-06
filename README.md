# User Guide for Mixed TELL-Seq and Standard Illumina Library Run

## Overview

Universal Sequencing Technology’s TELL-Seq libraries and standard Illumina libraries can be pooled for sequencing in the same sequencing run on an Illumina sequencing system. We recommend loading TELL-Seq libraries and standard Illumina libraries on separate lanes in the same flow cell.  This document describes procedures on how to set up the sample sheet for TELL-Seq and standard Illumina (Flex) libraries on separate lanes in the same flow cell for a NovaSeq run, and how to demultiplex different types of libraries after the run. 

## 1.	Sample sheet for preparing a 2-lane NovaSeq sequencing run

To ensure compatibility with downstream demultiplexing software, each lane should have only one type of library: either TELL-Seq or standard library type. When both types of libraries are sequenced in the same flow cell, the number of flow cycles for both index1 and index2 for all samples in the flow cell must be the same. TELL-seq libraries utilize an 18-base molecular barcode as the I7 index (i.e. index 1), as well as an 8-base sample barcode as the I5 index (i.e. index 2). Any sequencing runs containing TELL-Seq libraries must be sequenced at least 18 and 8 bases for index 1 and 2, respectively, in order to properly demultiplex and use TELL-seq’s linked read information. Illumina’s Flex libraries used here have a 10-base barcode for both indices.
When TELL-Seq libraries and Flex libraries are sequenced together, set 18 cycles for index 1 and 10 cycles for index 2. When an index length is shorter than the sequencing cycle number, add additional Ns for the missing bases for the index sequences on the sample sheet. TELL-seq libraries should designate 18 Ns as the index 1 sequence on the sample sheet.  The sample sheet file SampleSheet_before_seq_run.csv in the test directory is an example of how it should be set up for a mixed TELL-Seq (lane1) and Flex (lane2) libraries run:

Note: TELL-Seq custom sequencing primers must be spiked into standard sequencing primer wells on the sequencing cartridge for a run with mixed library types. 

## 2.	Sample sheet after sequencing run

To proceed with sample demultiplexing after the sequencing run, the sample sheet file must be modified to remove N’s trailing the sample barcode for index 1 and index 2 sequences. All samples from the same lane must designate the same length for index 1 and index 2. An example of such a sample sheet SampleSheet_after_seq_run.csv is given in test directory.

## 3.	 Demultiplexing of Flex library samples

Demultiplexing can be performed using the normal bcl2fastq workflow as in the following to produce a standard set of FASTQ files for each Flex library. 

```
bcl2fastq -R [ --runfolder-dir ] -o [ --output-dir ] --create-fastq-for-index-reads --sample-sheet /path/to/SampleSheet_after_seq_run.csv
```

## 4.	 Demultiplexing of TELL-Seq library samples

For TELL-Seq lane, this results in a set of FASTQ files that are not sample demultiplexed (Undetermined) and need to be further processed using the TELL-Seq demultiplexing software:

```
Undetermined_S0_L001_I1_001.fastq.gz
Undetermined_S0_L001_I2_001.fastq.gz
Undetermined_S0_L001_R1_001.fastq.gz
Undetermined_S0_L001_R2_001.fastq.gz
```

Execute following step to demultiplex TELL-Seq samples:

```
demult -i2 Undetermined_S0_L001_I2_001.fastq.gz -i1 Undetermined_S0_L001_I1_001.fastq.gz -r1 Undetermined_S0_L001_R1_001.fastq.gz -r2 Undetermined_S0_L001_R2_001.fastq.gz -p myrun -l sample_index_list
```
