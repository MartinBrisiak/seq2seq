import pandas as pd
import numpy as np
import string
from string import digits

from keras.models import Sequential, Model
from keras.layers import Dense, LSTM, CuDNNLSTM, Input, Embedding, TimeDistributed, Flatten, Dropout
from keras.callbacks import ModelCheckpoint


def main():
    with open('./cornell-movie-dialogs-corpus/movie_lines.txt', 'r', errors='ignore') as f:
        text = f.readlines()
    print(text)


if __name__ == "__main__":
    main()
