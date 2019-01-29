#!/bin/bash

HOST=0.0.0.0
python $HADOOP_PREFIX/configure-hadoop.py -hostname $HOST

bin/hdfs namenode -format -force
bin/hdfs namenode
