#!/bin/bash

# Example of usage:
# CUDA_VISIBLE_DEVICES=1 ./run_mnist.sh 10 xp1
# Then connect to wandb to see the results.

jupyter nbconvert --to=script --output-dir=experiments/ ./run_mnist.ipynb
for c in 0 1 2 3 5 6 7 9; do
  echo "Run experiments for class $c"
  for i in `seq 1 $1`; do
    echo "Run experiment n°$i from script $0 with group mnist${c}_$2 in class $c"
    PLOTLY_RENDERER=png DATASET_NAME=mnist IN_CLASS=$c WANDB_GROUP=mnist${c}_$2 python experiments/run_mnist.py
  done
done
