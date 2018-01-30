
#!/bin/bash

#$ -N sra_download_04          # name of the job
#$ -o /data/users/$USER/BioinformaticsSG/Getting-Data/sra_download_03.out   # contains what would normally be printed to std$
#$ -e /data/users/$USER/BioinformaticsSG/Getting-Data/sra_download_03.err   # file name to print standard error messages to.$
#$ -q free64,som,asom       # request cores from the free64, som, asom queues.
#$ -pe openmp 8-64          # request parallel environment. You can include a minimum and maximum core count.
#$ -m beas                  # send you email of job status (b)egin, (e)rror, (a)bort, (s)uspend
#$ -ckpt blcr               # (c)heckpoint: writes a snapshot of a process to disk, (r)estarts the process after the checkpo$

module load blcr
module load SRAToolKit

# Here we are assigning variables with paths
DIR=/data/users/$USER/BioinformaticsSG/Getting-Data
DATA=${DIR}/sra_data_04
DATA2=${DIR}/sra_fastq_04

# Here we are making two  new directories, DATA is for our sra data and DATA2 is for the fastq file
mkdir ${DATA}
mkdir ${DATA2}

# Here we are changing our current directory to the DATA directory
cd ${DATA}

for ID in $(cat ${DIR}/SRR_Acc_List.txt); do
        PREFIX=`echo ${ID} | head -c 3`
        BASE=`echo ${ID} | head -c 6`
        echo $USER is downloading ${ID}
        wget ftp://ftp-trace.ncbi.nlm.nih.gov/sra/sra-instant/reads/ByRun/sra/${PREFIX}/${BASE}/${ID}/${ID}.sra
        fastq-dump --outdir ${DATA2} -X 5 ${DATA}/${ID}.sra
done
