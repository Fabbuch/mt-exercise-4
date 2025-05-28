#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data/subset
configs=$base/configs

translations=$base/translations

mkdir -p $translations

src="nl"
trg="de"


num_threads=8
device=0

# best model: BPE4k
model_name="transformer_bpe_4000"

# iterate over beam_sizes 1, 2, 4, 8, 10, 12, 20, 30, 50, 100

for beam_size in 1 2 4 8 10 12 20 30 50 100

do
echo "###############################################################################"
echo "model_name $model_name"

translations_sub=$translations/$model_name
configs_sub=$configs/beam_size_experiments

mkdir -p $translations_sub
mkdir -p $configs_sub

# make config with beam_size
sed -E "s/beam_size: [0-9]+/beam_size: $beam_size/" $configs/$model_name.yaml > $configs_sub/$model_name.$beam_size.yaml

# measure time

SECONDS=0

CUDA_VISIBLE_DEVICES=$device OMP_NUM_THREADS=$num_threads python -m joeynmt translate $configs_sub/$model_name.$beam_size.yaml < $data/test.$src > $translations_sub/test.$model_name.$beam_size.$trg

et=$SECONDS

echo "time taken:"
echo "$et seconds"

# compute case-sensitive BLEU 

cat $translations_sub/test.$model_name.$beam_size.$trg | sacrebleu $data/test.$trg > $translations_sub/BLEU.$beam_size.json
echo $et > $translations_sub/seconds.$beam_size.txt
done
