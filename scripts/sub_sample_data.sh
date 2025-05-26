#! /bin/bash

scripts=$(dirname "$0")
base=$scripts/..

data=$base/data
subset=$data/subset

# create subset folder for subset of training data of nl->de data
mkdir -p $subset

head -n 100000 $data/train.nl-de.de > $subset/train.de
head -n 100000 $data/train.nl-de.nl > $subset/train.nl
cat $data/test.nl-de.de > $subset/test.de
cat $data/test.nl-de.nl > $subset/test.nl
cat $data/dev.nl-de.de > $subset/dev.de
cat $data/dev.nl-de.nl > $subset/dev.nl