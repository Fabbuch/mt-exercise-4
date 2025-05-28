#!/usr/bin/env python3

import sys

def get_joint_vocab(files):
    joint_vocab = []
    for file in files:
        with open(file, "r") as f:
            for line in f:
                token, freq = line.rstrip("\n").split(" ")
                if token not in joint_vocab:
                    joint_vocab.append(token)
    return joint_vocab

def write_vocab(file, vocab):
    with open(file, "w") as f:
        f.write("\n".join(vocab))

if __name__ == "__main__":
    infiles = sys.argv[1:-1]
    outfile = sys.argv[-1]
    vocab = get_joint_vocab(infiles)
    write_vocab(outfile, vocab)