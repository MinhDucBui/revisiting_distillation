# Activate conda env
# ...

# Model Path
model=<model_path>
output_dir=<output_dir>

# Define GLUE tasks
tasks=("mrpc" "cola" "rte" "sst2" "mnli" "qnli" "qqp")

# Define learning rates and batch sizes to loop over
learning_rates=("1e-5" "3e-5" "5e-5" "8e-5")
batch_sizes=("16" "32")

# Loop over GLUE tasks
for task in "${tasks[@]}"; do
    # Loop over batch sizes
    for batch_size in "${batch_sizes[@]}"; do
        # Loop over learning rates
        for lr in "${learning_rates[@]}"; do
            python run_glue.py \
                --model_name_or_path $model \
                --task_name $task \
                --max_seq_length 128 \
                --output_dir $output_dir/$task/$model \
                --overwrite_output_dir \
                --do_train --do_eval \
                --per_device_train_batch_size $batch_size \
                --gradient_accumulation_steps 1 \
                --per_device_eval_batch_size $batch_size \
                --learning_rate $lr \
                --weight_decay 0.01 \
                --evaluation_strategy epoch \
                --max_grad_norm 1.0 \
                --num_train_epochs 5 \
                --lr_scheduler_type polynomial \
                --warmup_steps 50
        done
    done
done
