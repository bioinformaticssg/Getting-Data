#!/bin/bash

#$ -N sra_seq_test_03      # name of the job
#$ -o /data/users/$USER/BioinformaticsSG/Getting-Data/sra_seq_test_03.out   # contains what would normally be printed to stdout (the$
#$ -e /data/users/$USER/BioinformaticsSG/Getting-Data/sra_seq_test_03.err   # file name to print standard error messages to. These m$
#$ -q free64,som,asom       # request cores from the free64, som, asom queues.
#$ -pe openmp 8-64          # request parallel environment. You can include a minimum and maximum core count.
#$ -m beas                  # send you email of job status (b)egin, (e)rror, (a)bort, (s)uspend
#$ -ckpt blcr               # (c)heckpoint: writes a snapshot of a process to disk, (r)estarts the process after the checkpoint is c$

module load blcr
module load SRAToolKit

if [ $# -ne 1 ]; then
    echo "usage: nstart_seq nstop_seq"
    exit 1
fi

# Here we are assigning variables with paths
DIR=/data/users/$USER/BioinformaticsSG/Getting-Data/
DATA=${DIR}/data_03

# Here we are making a new directory assigned to the DATA variable
mkdir ${DATA}
# Here we are changing our current directory to the new file
cd ${DATA}

BIO=$1

esearch -db sra -query $1 2>> ${DATA}/query.txt
