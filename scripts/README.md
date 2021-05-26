```
Usage: demult -i2 <I2.fastq.gz> -i1 <I1.fastq.gz> -p <output_prefix> -m <mismatch allowed> -l <sample_index_list> -r1 <R1.fastq.gz> -r2 <optional, R2.fastq.gz>

	****** After this script run, gzip the output fastq file ******


Parameters:

	-i2 <I2.fastq.gz>	- Required, sample index read file.
	-i1 <I1.fastq.gz>	- Required, index1(barcode) read file.
	-r1 <R1.fastq.gz>	- Required, read1 file.
	-r2 <R2.fastq.gz>	- Optional, read2 file.
	-p <output_prefix>	- Required, output prefix.
	-m <mismatch allowed>	- Optional, # of mismatched bases allowed, the default is 1.
	-l <sample_index_list>	- Required, Tab-delimited index seqeuence and custom name for each sample per line.
```
