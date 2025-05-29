# MT Exercise 4: Byte Pair Encoding, Beam Search

## Instructions for custom scripts

### Installation

The `plot.py` script uses `pandas`and `matplotlib`, make sure to install them before running the script.

### Training

- After downloading the IWLST 2017 data, run `sub_sample_data.sh` to create a subset of 100k sentences in `data/subset/`
- Run `learn_bpe.sh` to learn BPE codes for a BPE2k and BPE4k. This creates the `vocab` subfolder and writes vocab files to it. It also uses the `merge_vocal.py`to create the joint vocab file.
- Run the `train.sh` script for each config in `configs` to train each model.

### Testing

- Run `evaluate_beam.sh` to run beam search experiments for beam sizes 1 2 4 8 10 12 20 30 50 and 100 with the BPE4k model. This writes a config for each beam size to the `configs` folder and writes sacrebleu results and compute times to a `translations` subfolder.
- Run the python script `plot.py` to produce the plots from the beam size experiments.
