#!/bin/bash
#SBATCH -J Box0-L3-R0
#SBATCH -o Box0-L3-R0.out
#SBATCH -e Box0-L3-R0.err
#SBATCH -N 4
#SBATCH -n 128
#SBATCH -p development
#SBATCH -t 2:00:00
#SBATCH --mail-user=carrel@ucsb.edu
#SBATCH --mail-type=all
module load intel
module load hdf5
module load mvapich2

cd $SLURM_SUBMIT_DIR
ibrun ../enzo.exe -d Box0-L3-R0.enzo
