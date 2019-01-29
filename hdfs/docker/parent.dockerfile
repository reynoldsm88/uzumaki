FROM centos:latest

ENV HADOOP_VERSION=2.9.2
ENV INSTALL_ROOT /opt/uzumaki
ENV HADOOP_PREFIX $INSTALL_ROOT/hadoop
ENV JAVA_HOME /usr

USER root
RUN yum install -y java-1.8.0-openjdk && \
    yum install -y net-tools && \
    yum install -y which && \
    yum install -y python && \
    yum clean all && \
    rm -r -f /var/cache/yum

RUN groupadd hadoop && useradd -m hadoop -g hadoop -s /bin/bash && mkdir $INSTALL_ROOT
COPY --chown=hadoop:hadoop ./distro/hadoop-$HADOOP_VERSION.tar.gz $INSTALL_ROOT
RUN cd $INSTALL_ROOT && \
    tar -xf hadoop-$HADOOP_VERSION.tar.gz && \
    mv hadoop-$HADOOP_VERSION hadoop


COPY --chown=hadoop:hadoop ./conf/hdfs-site-template.xml /tmp/core-site-template.xml
COPY --chown=hadoop:hadoop ./conf/core-site-template.xml /tmp/hdfs-site-template.xml
COPY --chown=hadoop:hadoop ./scripts/configure-hadoop.py $HADOOP_PREFIX/configure-hadoop.py
RUN ls -al $HADOOP_PREFIX

RUN cd $HADOOP_PREFIX && mkdir {data,tmp} && chown -R hadoop:hadoop $HADOOP_PREFIX

USER hadoop

WORKDIR $HADOOP_PREFIX
