# Activate conda env
# ...

# Specify the learning rates, batch sizes, and task names you want to use
learning_rates=("1e-5" "3e-5" "5e-5" "8e-5")
batch_sizes=(16 32)
task_names=("mrpc" "cola" "rte" "sst2" "mnli" "qqp" "qnli")

# Path to the Python script
python_script=<Path to the Python script>

# Common parameters
common_params="--model_name_or_path <model_path> --max_seq_length 128 --overwrite_output_dir --do_train --do_eval --evaluation_strategy steps --gradient_accumulation_steps 1 --weight_decay 0.01 --eval_steps 500 --evaluation_strategy steps --max_grad_norm 1.0 --num_train_epochs 5 --lr_scheduler_type polynomial"

# Iterate over learning rates, batch sizes, and task names
for lr in "${learning_rates[@]}"; do
    for batch_size in "${batch_sizes[@]}"; do
        for task_name in "${task_names[@]}"; do
            # Create output directory based on task_name, learning_rate, and batch_size
            output_dir="${task_name}_lr${lr}_batch${batch_size}"

            # Execute the Python script with the current parameters
            $python_script $common_params --task_name $task_name --learning_rate $lr --per_device_train_batch_size $batch_size --per_device_eval_batch_size $batch_size --output_dir $output_dir
        done
    done
done

end=$(date +"%T")
echo "Completed: $end"