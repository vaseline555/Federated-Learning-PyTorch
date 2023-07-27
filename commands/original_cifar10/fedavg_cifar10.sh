#!/bin/sh

# FedAvg experiments in Figure 4, 9 of (McMahan et al., 2016)
## IID split
python3 main.py \
    --exp_name FedAvg_CIFAR10_CNN_IID --seed 42 --device cuda \
    --dataset CIFAR10 \
    --split_type iid --test_size -1 \
    --model_name SimpleCNN --crop 24 --randhf 0.2 --randjit 0.2 --imnorm --hidden_size 32 \
    --algorithm fedavg --eval_fraction 1 --eval_type local --eval_every 1 --eval_metrics acc1 \
    --K 100 --R 5000 --E 5 --C 0.1 --B 50 --beta 0 \
    --optimizer SGD --lr 0.15 --lr_decay 0.99 --lr_decay_step 1 --criterion CrossEntropyLoss

## Pathological Non-IID split
python3 main.py \
    --exp_name FedAvg_CIFAR10_CNN_Patho --seed 42 --device cuda \
    --dataset CIFAR10 \
    --split_type patho --test_size -1 \
    --model_name SimpleCNN --crop 24 --randhf 0.2 --randjit 0.2 --imnorm --hidden_size 32 \
    --algorithm fedavg --eval_type local --eval_every 1 --eval_metrics acc1 \
    --K 100 --R 5000 --E 5 --C 0.1 --B 50 --beta 0 \
    --optimizer SGD --lr 0.01 --lr_decay 0.99 --lr_decay_step 1 --criterion CrossEntropyLoss
