#!/bin/bash

docker build -f ./hdfs/docker/parent.dockerfile -t reynoldsm88/uzumaki-parent hdfs
docker build -f ./hdfs/docker/namenode.dockerfile -t reynoldsm88/uzumaki-namenode hdfs
docker build -f ./hdfs/docker/datanode.dockerfile -t reynoldsm88/uzumaki-datanode hdfs

