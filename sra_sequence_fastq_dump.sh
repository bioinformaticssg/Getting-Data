#!/bin/bash

nstart="3744662"
nstop="3744667"

for ID in `seq ${nstart} ${nstop}`; do 
	echo downloading SRR$ID
	#fastq-dump SRR$ID
done