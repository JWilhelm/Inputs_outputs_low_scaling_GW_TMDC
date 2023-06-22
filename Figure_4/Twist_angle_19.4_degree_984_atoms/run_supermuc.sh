#!/bin/bash
# Job Name and Files (also --job-name)
#SBATCH -J MoS2_632

#Output and error (also --output, --error):
#SBATCH -o ./%x.%j.out
#SBATCH -e ./%x.%j.err

#Initial working directory (also --chdir):
#SBATCH -D ./

# Change here the job size and time limit:
#SBATCH --time=47:55:00
#SBATCH --nodes=128
#SBATCH --ntasks-per-core=1
#SBATCH --ntasks-per-node=12
#SBATCH --partition=fat
#SBATCH --no-requeue

#Setup of execution environment
#SBATCH --export=NONE
#SBATCH --get-user-env
#SBATCH --account=pn72pa

module load slurm_setup
export OMP_NUM_THREADS=1
ulimit -s unlimited
export OMP_STACKSIZE=2000m
exec="/hppfs/work/pn72pa/di76zil/23_compilation/54_printing_LDOS_and_local_gap/cp2k/exe/supermuc_jw_intel19_2022_04_11/cp2k.psmp"

mpiexec -n $SLURM_NTASKS $exec *.inp >& cp2k.out
