#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data
subset=$data/subset
vocab=$base/vocab

# learn joint bpe for 2k voc size BPE model
subword-nmt learn-joint-bpe-and-vocab --input $subset/train.de $subset/train.nl -s 2000 -t -o $data/codes2000.bpe --write-vocabulary $vocab/vocab2000.de $vocab/vocab2000.nl

# merge language specific vocabs into joint vocab file
python $scripts/merge_vocab.py $vocab/vocab2000.de $vocab/vocab2000.nl $vocab/joint_vocab2000.txt

# for 4k voc size
subword-nmt learn-joint-bpe-and-vocab --input $subset/train.de $subset/train.nl -s 4000 -t -o $data/codes4000.bpe --write-vocabulary $vocab/vocab4000.de $vocab/vocab4000.nl

python $scripts/merge_vocab.py $vocab/vocab4000.de $vocab/vocab4000.nl $vocab/joint_vocab4000.txt