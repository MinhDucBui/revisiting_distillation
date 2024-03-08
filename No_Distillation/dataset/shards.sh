#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=48:00:00
#SBATCH --mem=180000mb
#SBATCH --job-name=simple
#SBATCH -o /pfs/data5/home/ma/ma_ma/ma_mbui/academic-budget-bert/slurm/slurm-%j.out

now=$(date +"%T")
echo "Program starts:  $now"

# Activate conda env
# srun $1
# Run script
# conda activate clkd_fairness
export HYDRA_FULL_ERROR=1
srun python shard_data.py --dir /pfs/work7/workspace/scratch/ma_mbui-minbui/academic-budget-bert/dataset/data/final  -o /pfs/work7/workspace/scratch/ma_mbui-minbui/academic-budget-bert/dataset/data/shards --num_train_shards 256 --num_test_shards 128 --frac_test 0.1


end=$(date +"%T")
echo "Completed: $end"