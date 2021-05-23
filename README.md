# User Guide for Mixed TELL-Seq and Standard Illumina Library Run

## Overview

Universal Sequencing Technology’s TELL-Seq libraries and standard Illumina libraries can be pooled for sequencing in the same sequencing run on an Illumina sequencing system. We recommend loading TELL-Seq libraries and standard Illumina libraries on separate lanes in the same flow cell.  This document describes procedures on how to set up the sample sheet for TELL-Seq and standard Illumina (Flex) libraries on separate lanes in the same flow cell for a NovaSeq run, and how to demultiplex different types of libraries after the run. 

## 1.	Sample sheet for preparing a 2-lane NovaSeq sequencing run

To ensure compatibility with downstream demultiplexing software, each lane should have only one type of library: either TELL-Seq or standard library type. When both types of libraries are sequenced in the same flow cell, the number of flow cycles for both index1 and index2 for all samples in the flow cell must be the same. TELL-seq libraries utilize an 18-base molecular barcode as the I7 index (i.e. index 1), as well as an 8-base sample barcode as the I5 index (i.e. index 2). Any sequencing runs containing TELL-Seq libraries must be sequenced at least 18 and 8 bases for index 1 and 2, respectively, in order to properly demultiplex and use TELL-seq’s linked read information. Illumina’s Flex libraries used here have a 10-base barcode for both indices.
When TELL-Seq libraries and Flex libraries are sequenced together, set 18 cycles for index 1 and 10 cycles for index 2. When an index length is shorter than the sequencing cycle number, add additional Ns for the missing bases for the index sequences on the sample sheet. TELL-seq libraries should designate 18 Ns as the index 1 sequence on the sample sheet.  The sample sheet file SampleSheet.csv shown below should be set up for a mixed TELL-Seq (lane1) and Flex (lane2) libraries run:

 |<sub><sub>Lane</sub>|<sub><sub>Sample_ID|<sub><sub>Sample_Name<sub>|<sub><sub>Sample_Plate|<sub><sub>Sample_Well|<sub><sub>Index_Plate|<sub><sub>Index_Plate_Well|<sub><sub>I7_Index_ID|<sub><sub>index|<sub><sub>I5_Index_ID|<sub><sub>index2|<sub><sub>Sample_Project|<sub><sub>Description|
 | :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:|:-:|:-:|
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>TGTTCTAGNN|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>TCGATTGANN|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>ACTTAGCANN|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>AAGGTTCANN|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>ACTCGGCAATNNNNNNNN||<sub><sub>TTCAGTTGTC|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>GTCTAATGGCNNNNNNNN||<sub><sub>CCTGACCACT|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>CCATCTCGCCNNNNNNNN||<sub><sub>AACCATAGAA|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>CTGCGAGCCANNNNNNNN||<sub><sub>TGGCCGGATT|||
 
Note: TELL-Seq custom sequencing primers must be spiked into standard sequencing primer wells on the sequencing cartridge for a run with mixed library types. 

 
 |<sub><sub>Lane</sub>|<sub><sub>Sample_ID|<sub><sub>Sample_Name<sub>|<sub><sub>Sample_Plate|<sub><sub>Sample_Well|<sub><sub>Index_Plate|<sub><sub>Index_Plate_Well|<sub><sub>I7_Index_ID|<sub><sub>index|<sub><sub>I5_Index_ID|<sub><sub>index2|<sub><sub>Sample_Project|<sub><sub>Description|
 | :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:| :-:|:-:|:-:|
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>TGTTCTAG|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>TCGATTGA|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>ACTTAGCA|||
 |<sub><sub>1|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>NNNNNNNNNNNNNNNNNN||<sub><sub>AAGGTTCA|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>ACTCGGCAAT||<sub><sub>TTCAGTTGTC|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>GTCTAATGGC||<sub><sub>CCTGACCACT|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>CCATCTCGCC||<sub><sub>AACCATAGAA|||
 |<sub><sub>2|<sub><sub>TellSeq-01|<sub><sub>TellSeq-01||||||<sub><sub>CTGCGAGCCA||<sub><sub>TGGCCGGATT|||
 
## 2.	Sample sheet after sequencing run

To proceed with sample demultiplexing after the sequencing run, the SampleSheet.csv file must be modified to remove N’s trailing the sample barcode for index 1 and index 2 sequences. All samples from the same lane must designate the same length for index 1 and index 2.

### Demultiplexing of Flex library samples

Demultiplexing can be performed using the normal bcl2fastq workflow as in the following to produce a standard set of FASTQ files for each Flex library. 

```
bcl2fastq -R [ --runfolder-dir ] -o [ --output-dir ] --create-fastq-for-index-reads --sample-sheet /path/to/SampleSheet.csv
```

### Demultiplexing of TELL-Seq library samples

For TELL-Seq lane, this results in a set of FASTQ files that are not sample demultiplexed (Undetermined) and need to be further processed using the TELL-Seq demultiplexing software:

```
Undetermined_S0_L001_I1_001.fastq.gz
Undetermined_S0_L001_I2_001.fastq.gz
Undetermined_S0_L001_R1_001.fastq.gz
Undetermined_S0_L001_R2_001.fastq.gz
```

Execute following step to demultiplex TELL-Seq samples:

```
demult Undetermined_S0_L001_I2_001.fastq.gz Undetermined_S0_L001_R1_001.fastq.gz Undetermined_S0_L001_R2_001.fastq.gz sample_index_list
```
