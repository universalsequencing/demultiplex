#!/bin/bash

./demult -i2 ../fastq/Undetermined_S0_L001_I2_001.fastq.gz \
	 -i1 ../fastq/Undetermined_S0_L001_I1_001.fastq.gz \
	 -r1 ../fastq/Undetermined_S0_L001_R1_001.fastq.gz \
	 -r2 ../fastq/Undetermined_S0_L001_R2_001.fastq.gz \
	 -p test \
	 -l ../test/sample_index_list.txt 

#pigz *.fastq
gzip *.fastq
