#!/bin/bash

nstart="3744659"
nstop="3744667"

for ID in `seq ${nstart} ${nstop}`; do 
	echo $USER is downloading SRR${ID}
	#fastq-dump SRR$ID
done
