python3 -m llamabpt.train \
    --mesh_dim='1,1,1,32' \
    --dtype='bf16' \
    --total_steps=480000 \
    --log_freq=200 \
    --save_model_freq=0 \
    --save_milestone_freq=1000 \
    --load_llama_config='7b' \
    --update_llama_config="dict(max_sequence_length=524288,scan_attention=True,scan_query_chunk_size=2048,scan_key_chunk_size=4096,remat_attention='nothing_saveable',scan_mlp=True,scan_mlp_chunk_size=2048,remat_mlp='nothing_saveable',remat_block='nothing_saveable',scan_layers=True,attention_type='ring_blockwise',param_scan_axis=0,mesh_dim='1,1,4,8')" \
    --load_dataset_state='' \
    --load_checkpoint='' \
    --tokenizer.vocab_file="gs://hxtpu_bucket/llama2_tokenizer.model" \
    --optimizer.type='adamw' \
    --optimizer.adamw_optimizer.weight_decay=0.1 \
    --optimizer.adamw_optimizer.lr=1.5e-4 \
    --optimizer.adamw_optimizer.end_lr=1.5e-5 \
    --optimizer.adamw_optimizer.lr_warmup_steps=2000 \
    --optimizer.adamw_optimizer.lr_decay_steps=480000 \
    --train_dataset.text_processor.fields='text' \
    --train_dataset.type=huggingface \
    --train_dataset.huggingface_dataset.path='mc4' \
    --train_dataset.huggingface_dataset.name='en' \
    --train_dataset.huggingface_dataset.split='train' \
    --train_dataset.huggingface_dataset.streaming=True \
    --train_dataset.huggingface_dataset.seq_length=524288 \
    --train_dataset.huggingface_dataset.batch_size=1 \
    --checkpointer.save_optimizer_state=True