#!/bin/bash

docker run -h uzumaki-namenode-test -p 9000:9000 -p 50070:50070 -p 50470:50470 --name uzumaki-namenode-test -t reynoldsm88/uzumaki-namenode
