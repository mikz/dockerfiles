FROM ubuntu:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN apt-get -y install software-properties-common python-software-properties lsb-release wget
RUN apt-add-repository -y ppa:transmissionbt/ppa

RUN apt-get -y update && apt-get -y upgrade
RUN apt-get -y install supervisor transmission-cli transmission-daemon openssh-server

RUN adduser transmission --home /mnt/storage --disabled-password -q
RUN mkdir /var/run/sshd

RUN apt-get -y install ruby1.9.1-dev rubygems cron
RUN gem1.9.1 install prss --no-rdoc --no-ri

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD sshd_config /etc/ssh/sshd_config
RUN chmod 600 /etc/ssh/sshd_config

WORKDIR /mnt/storage/

CMD ["/usr/bin/supervisord"]

EXPOSE 22 9091 51413
