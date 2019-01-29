#!/bin/bash

HOST=$(hostname -f)
python $HADOOP_PREFIX/configure-hadoop.py -hostname $HOST

bin/hdfs datanode
