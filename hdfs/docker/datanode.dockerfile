#################
#
# HDFS Namenode
#
#################

FROM reynoldsm88/uzumaki-parent

ENV NAME_NODE_DIR $HDFS_DATA_ROOT/namenode

COPY --chown=hadoop:hadoop ./scripts/start-datanode.sh $HADOOP_PREFIX/start-datanode.sh

# Web UI
EXPOSE 50075

# https
EXPOSE 50475

# Data transfer
EXPOSE 50010

# metadata operations
EXPOSE 50020

ENTRYPOINT $HADOOP_PREFIX/start-datanode.sh