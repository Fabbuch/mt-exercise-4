#!/usr/bin/env python3

import pandas as pd
import matplotlib.pyplot as plt
import json
from math import log

beam_sizes = [1, 2, 4, 8, 10, 12, 20, 30, 50, 100]

score_list = []
seconds_list = []
for beam_size in beam_sizes:
    with open(f"translations/transformer_bpe_4000/BLEU.{str(beam_size)}.json", "r") as f1:
        data = json.load(f1)
        score = data["score"]
    with open(f"translations/transformer_bpe_4000/seconds.{str(beam_size)}.txt", "r") as f2:
        seconds = int(f2.readline().strip("\n"))
    score_list.append(score)
    seconds_list.append(seconds)

data_dict = {"beam size": beam_sizes, "score": score_list, "seconds": seconds_list}

df = pd.DataFrame(data_dict)
print(df)

# plot BLEU score for each beam size
plt.figure(figsize=(10, 6))
plt.plot("beam size", "score", marker="o", data=df)
plt.grid(axis = 'x')

plt.xlabel('Beam size')
plt.ylabel('BLEU score')
plt.legend()

# plot compute time for each beams size
plt.figure(figsize=(10, 6))
plt.plot("beam size", "seconds", marker="o", data=df)
plt.grid(axis = 'x')

plt.xlabel('Beam size')
plt.ylabel('BLEU score')
plt.legend()

plt.show()