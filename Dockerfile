FROM ubuntu:latest

MAINTAINER Priyanshu Shekhar

ENV ANT_VERSION 1.9.5

# Install required libs
RUN apt-get update
RUN apt-get install -y git
RUN apt-get install -y openjdk-7-jre
RUN apt-get install -y openjdk-7-jdk
RUN apt-get install -y wget

# Install ANT
RUN cd && \
    wget -q http://www.us.apache.org/dist//ant/binaries/apache-ant-${ANT_VERSION}-bin.tar.gz && \
    tar -xzf apache-ant-${ANT_VERSION}-bin.tar.gz && \
    mv apache-ant-${ANT_VERSION} /opt/ant && \
    rm apache-ant-${ANT_VERSION}-bin.tar.gz
ENV ANT_HOME /opt/ant
ENV PATH ${PATH}:/opt/ant/bin

# Install firefox latest
RUN apt-get update -qqy \
  && apt-get -qqy --no-install-recommends install \
    firefox \
  && rm -rf /var/lib/apt/lists/*

# Install vnc to access display of docker container
RUN apt-get update -qqy \
	&& apt-get -qqy install \
	x11vnc \
	&& rm -rf /var/lib/apt/lists/* \
	&& mkdir -p ~/.vnc \
	&& x11vnc -storepasswd 123456 ~/.vnc/passwd

RUN apt-get update
RUN apt-get install -y Xvfb

# Make directory where selenium repo will be cloned
RUN mkdir selenium-workspace
RUN cd selenium-workspace

EXPOSE 5900
