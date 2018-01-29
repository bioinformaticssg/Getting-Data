#!/bin/bash

#$ -N sra_seq_test_01      # name of the job
#$ -o /data/users/$USER/BioinformaticsSG/Getting-Data/sra_seq_test_01.out    # contains what would normally be printed to stdout (the terminal). The file sra11.out go the location indicated by the path.
#$ -e /data/users/$USER/BioinformaticsSG/Getting-Data/sra_seq_test_01.err   # file name to print standard error messages to. These messages would normally be printed to the the terminal. The file sra11.err wil go the location indicated by the path.
#$ -q free64,som,asom       # request cores from the free64, som, asom queues.
#$ -pe openmp 8-64          # request parallel environment. You can include a minimum and maximum core count.
#$ -m beas                  # send you email of job status (b)egin, (e)rror, (a)bort, (s)uspend
#$ -ckpt blcr               # (c)heckpoint: writes a snapshot of a process to disk, (r)estarts the process after the checkpoint is complete

module load blcr
module load SRAToolKit

# Here we are assigning variables with paths
DIR=/data/users/$USER/BioinformaticsSG/Getting-Data/
DATA=${DIR}/data_1

mkdir ${DATA}
# Here we are changing our current directory to the new file
cd ${DATA}

nstart="3744659"
nstop="3744667"

for ID in `seq ${nstart} ${nstop}`; do 
	echo $USER is downloading SRR${ID}
done
