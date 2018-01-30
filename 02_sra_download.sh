
#!/bin/bash

#$ -N sra_download          # name of the job
#$ -o /data/users/$USER/BioinformaticsSG/Getting-Data/sra_download.out   # contains what would normally be printed to stdout (the$
#$ -e /data/users/$USER/BioinformaticsSG/Getting-Data/sra_download.err   # file name to print standard error messages to. These m$
#$ -q free64,som,asom       # request cores from the free64, som, asom queues.
#$ -pe openmp 8-64          # request parallel environment. You can include a minimum and maximum core count.
#$ -m beas                  # send you email of job status (b)egin, (e)rror, (a)bort, (s)uspend
#$ -ckpt blcr               # (c)heckpoint: writes a snapshot of a process to disk, (r)estarts the process after the checkpoint is c$

module load blcr
module load SRAToolKit

# Here we are assigning variables with paths
DIR=/data/users/$USER/BioinformaticsSG/Getting-Data
DATA=${DIR}/sra_data_03
DATA2=${DIR}/sra_fastq_03

# Here we are making two  new directories, DATA is for our sra data and DATA2 is for the fastq file
mkdir ${DATA}
mkdir ${DATA2}

# Here we are changing our current directory to the DATA directory
cd ${DATA}

PREFIX="SRR"
BASE="SRR374" 
nstart_seq="4667"
nstop_seq="4667"

for ID in `seq ${nstart_seq} ${nstop_seq}`; do
        SRA_FILE=${BASE}${ID}
        echo $USER is downloading ${SRA_FILE}
        wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/${PREFIX}/${BASE}/${SRA_FILE}/${SRA_FILE}.sra
        fastq-dump --outdir ${DATA2} -X 5 ${DATA}/${SRA_FILE}.sra
done
