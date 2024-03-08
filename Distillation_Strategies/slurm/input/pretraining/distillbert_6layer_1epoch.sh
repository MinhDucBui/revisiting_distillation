# Activate conda env
# ...

deepspeed ../../../task_agnostic_distillation/run_pretraining.py \
    --model_type bert-mlm \
    --deepspeed \
    --tokenizer_name bert-base-uncased \
    --hidden_act gelu \
    --hidden_dropout_prob 0.1 \
    --attention_probs_dropout_prob 0.1 \
    --encoder_ln_mode post-ln \
    --lr 5e-4 \
    --lr_schedule time \
    --max_steps 24000000 \
    --curve linear \
    --warmup_proportion 0.06 \
    --gradient_clipping 0.0 \
    --optimizer_type adamw \
    --weight_decay 0.01 \
    --adam_beta1 0.9 \
    --adam_beta2 0.98 \
    --adam_eps 1e-6 \
    --dataset_path <dataset_path> \
    --output_dir <output_dir> \
    --print_steps 100 \
    --num_epochs_between_checkpoints 100 \
    --project_name budget-bert-pretraining-post \
    --validation_epochs 100 \
    --validation_epochs_begin 20 \
    --validation_epochs_end 10 \
    --validation_begin_proportion 0.05 \
    --validation_end_proportion 0.01 \
    --validation_micro_batch 64 \
    --data_loader_type dist \
    --do_validation \
    --use_early_stopping \
    --early_stop_time 180 \
    --early_stop_eval_loss 6 \
    --seed 43 \
    --layernorm_embedding \
    --hidden_size 768 \
    --num_hidden_layers 6 \
    --num_attention_heads 12 \
    --intermediate_size 3072 \
    --layer_selection -1 \
    --distillation \
    --teacher_path <teacher_path> \
    --total_training_time 4.0 \
    --early_exit_time_marker 4.0 \
    --train_batch_size 1024 \
    --train_micro_batch_size_per_gpu 256 \
    --job_name distillbert \
    --current_run_id 1 \
    --method distillbert \
    --finetune_time_markers 0.2,0.4,0.6,0.8,0.95 \
    --fused_linear_layer false \
    --layer_norm_type pytorch \
    --fp16 \
    --fp16_backend ds

# Change method to change distillation strategy: tinybert, minilm_v2 and distillbert


end=$(date +"%T")
echo "Completed: $end"