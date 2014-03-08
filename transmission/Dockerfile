FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-add-repository -y ppa:transmissionbt/ppa \
 && apt-get -q -y update \
 && apt-get -q -y install supervisor transmission-cli transmission-daemon openssh-server

RUN adduser transmission --home /mnt/storage --disabled-password -q \
 && mkdir /var/run/sshd

RUN apt-get -y install ruby1.9.1-dev rubygems cron \
 && gem1.9.1 install prss --no-rdoc --no-ri

ADD supervisord.conf /etc/supervisor/conf.d/supervisord.conf
ADD sshd_config /etc/ssh/sshd_config
ADD crontab /root/crontab

RUN chmod 600 /etc/ssh/sshd_config \
 && crontab -u transmission /root/crontab && rm /root/crontab

WORKDIR /mnt/storage/

CMD ["/usr/bin/supervisord"]

EXPOSE 22 9091 51413
