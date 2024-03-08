# Activate conda env
# ...

# Run script
/home/ma/ma_ma/ma_mbui/.conda/envs/izsak2/bin/deepspeed  run_pretraining.py \
  --model_type bert-mlm --tokenizer_name bert-large-uncased \
  --hidden_act gelu \
  --hidden_size 1024 \
  --num_hidden_layers 12 \
  --num_attention_heads 16 \
  --intermediate_size 4096 \
  --hidden_dropout_prob 0.1 \
  --attention_probs_dropout_prob 0.1 \
  --encoder_ln_mode pre-ln \
  --lr 1e-3 \
  --train_batch_size 1024 \
  --train_micro_batch_size_per_gpu 256 \
  --lr_schedule time \
  --curve linear \
  --warmup_proportion 0.06 \
  --gradient_clipping 0.0 \
  --optimizer_type adamw \
  --weight_decay 0.01 \
  --adam_beta1 0.9 \
  --adam_beta2 0.98 \
  --adam_eps 1e-6 \
  --total_training_time 11.3 \
  --early_exit_time_marker 11.3 \
  --dataset_path <dataset_path> \
  --output_dir <output_dir> \
  --print_steps 10000 \
  --num_epochs_between_checkpoints 10000 \
  --job_name 12l_7h \
  --project_name budget-bert-pretraining \
  --validation_epochs 100 \
  --validation_epochs_begin 20 \
  --validation_epochs_end 10 \
  --validation_begin_proportion 0.05 \
  --validation_end_proportion 0.01 \
  --validation_micro_batch 16 \
  --deepspeed \
  --data_loader_type dist \
  --do_validation \
  --use_early_stopping \
  --early_stop_time 180 \
  --early_stop_eval_loss 6 \
  --seed 50 \
  --fp16



end=$(date +"%T")
echo "Completed: $end"