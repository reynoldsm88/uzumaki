FROM reynoldsm88/uzumaki-parent

EXPOSE 9000 50070 50470

COPY --chown=hadoop:hadoop ./scripts/start-namenode.sh $HADOOP_PREFIX/start-namenode.sh

ENTRYPOINT $HADOOP_PREFIX/start-namenode.sh