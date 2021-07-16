#!/bin/bash
#SBATCH -J Box0-L3-R1
#SBATCH -o Box0-L3-R1.out
#SBATCH -e Box0-L3-R1.err
#SBATCH -N 4
#SBATCH -n 192
#SBATCH -p skx-dev
#SBATCH -t 2:00:00
#SBATCH --mail-user=carrel@ucsb.edu
#SBATCH --mail-type=all
module load intel
module load hdf5
module load mvapich2

cd $SLURM_SUBMIT_DIR
ibrun ../enzo.exe -d -r DD0042/data0042
