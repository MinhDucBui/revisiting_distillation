#!/bin/bash
#SBATCH --ntasks=1
#SBATCH --time=24:00:00
#SBATCH --mem=180000mb
#SBATCH --cpus-per-task=16
#SBATCH --job-name=simple
#SBATCH -o /pfs/data5/home/ma/ma_ma/ma_mbui/academic-budget-bert/slurm/slurm-%j.out

now=$(date +"%T")
echo "Program starts:  $now"

# Activate conda env
# srun $1
# Run script
# conda activate clkd_fairness
export HYDRA_FULL_ERROR=1
srun python /pfs/data5/home/ma/ma_ma/ma_mbui/academic-budget-bert/dataset/generate_samples.py --dir /pfs/work7/workspace/scratch/ma_mbui-minbui/academic-budget-bert/dataset/data/shards -o /pfs/work7/workspace/scratch/ma_mbui-minbui/academic-budget-bert/dataset/data/preprocessed_data --dup_factor 20 --seed 42 --vocab_file /pfs/data5/home/ma/ma_ma/ma_mbui/bert_uncased_vocab/vocab.txt --do_lower_case 1 --masked_lm_prob 0.15 --max_seq_length 128 --model_name bert-base-uncased --max_predictions_per_seq 20 --n_processes 16


end=$(date +"%T")
echo "Completed: $end"