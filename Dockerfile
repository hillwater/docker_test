FROM ubuntu:trusty
MAINTAINER hillwater <hillwater.zju@gmail.com>

ENV JAVA_VERSION 8
ENV EDP2_DIR /opt/edp2
ENV EDP2_BIN_DIR ${EDP2_DIR}/bin

RUN apt-get update && apt-get -y install software-properties-common python-software-properties

RUN \
  add-apt-repository -y ppa:webupd8team/java && \
  apt-get update && \
  echo oracle-java${JAVA_VERSION}-installer shared/accepted-oracle-license-v1-1 select true \
       | /usr/bin/debconf-set-selections && \
  apt-get -y install \
          oracle-java${JAVA_VERSION}-installer && \
  rm -rf /var/lib/apt/lists/* && \
  rm /var/cache/oracle-jdk${JAVA_VERSION}-installer/jdk-*.tar.gz

RUN update-alternatives --display java

RUN mkdir -p ${EDP2_DIR}
RUN mkdir -p ${EDP2_BIN_DIR}

ADD ./run.sh ${EDP2_BIN_DIR}/
