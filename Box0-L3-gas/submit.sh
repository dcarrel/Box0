#!/bin/bash
#SBATCH -J Box0-L3-gas
#SBATCH -o Box0-L3-gas.out
#SBATCH -e Box0-L3-gas.err
#SBATCH -N 4
#SBATCH -n 32
#SBATCH -p development
#SBATCH -t 02:00:00
#SBATCH --mail-user=carrel@ucsb.edu
#SBATCH --mail-type=all
module load intel
module load hdf5
module load mvapich2

cd $SLURM_SUBMIT_DIR
ibrun ../enzo.exe -d Box0-L3-gas.enzo
