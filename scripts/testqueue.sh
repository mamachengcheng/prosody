#!/bin/bash

#SBATCH -n 1
#SBATCH -p gputest
#SBATCH -t 00:15:00
#SBATCH --mem-per-cpu=64000
#SBATCH -J PERTTI_reg
#SBATCH -o PERTTI_reg.out.%j
#SBATCH -e PERTTI_reg.err.%j
#SBATCH --gres=gpu:k80:1
#SBATCH

module purge
module load gcc cuda python-env/3.6.3-ml

SRCDIR=/homeappl/home/celikkan/Github/BERT-prosody
DATADIR=$SRCDIR/data

python  $SRCDIR/main.py --datadir $DATADIR --number_of_sents 100 --model Regression
#python  $SRCDIR/main.py --datadir $DATADIR --number_of_sents 100 --model BertUncased

