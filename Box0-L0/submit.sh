#!/bin/bash
#SBATCH -J Box0-L0
#SBATCH -o Box0-L0.out
#SBATCH -e Box0-L0.err
#SBATCH -N 1
#SBATCH -n 4
#SBATCH -p normal
#SBATCH -t 04:00:00
#SBATCH --mail-user=carrel@ucsb.edu
#SBATCH --mail-type=all
module load intel
module load hdf5
module load mvapich2

cd $SLURM_SUBMIT_DIR
ibrun ./$WORK2/Box0/enzo.exe -d Box0-L0.enzo
