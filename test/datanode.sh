#!/bin/bash

docker run -h uzumaki-datanode-test -p 50075:50075 -p 50475:50475 -p 50010:50010 -p 50020:50020 --name uzumaki-datanode-test -t reynoldsm88/uzumaki-datanode
