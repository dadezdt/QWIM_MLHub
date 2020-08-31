import os
import pandas as pd
import pprint

import tensorflow as tf
import tensorflow.contrib.slim as slim

from data_model import StockDataSet
from model_rnn import LstmRNN

flags = tf.app.flags
flags.DEFINE_integer("stock_count", 49, "Stock count")
flags.DEFINE_integer("input_size", 1, "Input size")
flags.DEFINE_integer("num_steps", 90, "Num of steps ")
flags.DEFINE_integer("num_layers", 1, "Num of layer")
flags.DEFINE_integer("lstm_size", 128, "Size of one LSTM cell")
flags.DEFINE_integer("batch_size", 64, "The size of batch images")
flags.DEFINE_float("keep_prob", 0.8, "Keep probability of dropout layer.")
flags.DEFINE_float("init_learning_rate", 0.001, "Initial learning rate at early stage.")
flags.DEFINE_float("learning_rate_decay", 0.99, "Decay rate of learning rate.")
flags.DEFINE_integer("init_epoch", 5, "Num. of epoches considered as early stage.")
flags.DEFINE_integer("max_epoch", 50, "Total training epoches.")
flags.DEFINE_integer("embed_size", None, "If provided, use embedding vector of this size.")
flags.DEFINE_string("stock_symbol", None, "Target stock symbol")
flags.DEFINE_integer("sample_size", 4, "Number of stocks to plot during training.")
flags.DEFINE_boolean("train", False, "True for training, False for testing")

FLAGS = flags.FLAGS

pp = pprint.PrettyPrinter()

if not os.path.exists("logs"):
    os.mkdir("logs")


def show_all_variables():
    model_vars = tf.trainable_variables()
    slim.model_analyzer.analyze_vars(model_vars, print_info=True)


def load_data(input_size, num_steps, k=None, target_symbol=None, test_ratio=0.20):
    if target_symbol is not None:
        return [
            StockDataSet(
            target_symbol,
            input_size=input_size,
            num_steps=num_steps,
            test_ratio=test_ratio)
                ]
 
    info = pd.read_csv('index_list.csv')

    if k is not None:
        info = info.head(k)
    
    return [
        StockDataSet(row['symbol'],
                 input_size=input_size,
                 num_steps=num_steps,
                 test_ratio=test_ratio)
        for _, row in info.iterrows()
        ]


def main(_):
    pp.pprint(flags.FLAGS.__flags)

    # gpu_options = tf.GPUOptions(per_process_gpu_memory_fraction=0.333)
    run_config = tf.ConfigProto()
    run_config.gpu_options.allow_growth = True

    with tf.Session(config=run_config) as sess:
        rnn_model = LstmRNN(
            sess,
            FLAGS.stock_count,
            lstm_size=FLAGS.lstm_size,
            num_layers=FLAGS.num_layers,
            num_steps=FLAGS.num_steps,
            input_size=FLAGS.input_size,
            embed_size=FLAGS.embed_size,
        )

        show_all_variables()

        stock_data_list = load_data(
            FLAGS.input_size,
            FLAGS.num_steps,
            k=FLAGS.stock_count,
            target_symbol=FLAGS.stock_symbol,
        )

        if FLAGS.train:
            rnn_model.train(stock_data_list, FLAGS)
        else:
            if not rnn_model.load()[0]:
                raise Exception("[!] Train a model first, then run test mode")


if __name__ == '__main__':
    tf.app.run()
