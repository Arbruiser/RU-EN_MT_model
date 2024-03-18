#!/bin/bash

#SBATCH -J training
#SBATCH -o training.out
#SBATCH -e training.err
#SBATCH -A project_2001403
#SBATCH -t 72:00:00
#SBATCH -p gpu
#SBATCH -n 1
#SBATCH -N 1
#SBATCH --gres=gpu:v100:1
#SBATCH --mail-type=ALL
#SBATCH --mail-user=
#SBATCH --cpus-per-task 4
#SBATCH --mem-per-cpu=4G


echo "Starting at `date`"

# stops the script when encountering an error
# (useful if running several commands in the same script)
set -e

# load the relevant module
module use -a /projappl/nlpl/software/modules/etc
module load nlpl-opennmt-py

onmt_train -attn_debug -config ./config_transformer.yaml

echo "Finishing at `date`"
