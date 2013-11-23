FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN apt-get -y install apt-transport-https

RUN gpg --keyserver keyserver.ubuntu.com --recv-keys 561F9B9CAC40B2F7
RUN gpg --armor --export 561F9B9CAC40B2F7 | apt-key add -
RUN wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -

RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger `lsb_release -c -s` main"  > /etc/apt/sources.list.d/passenger.list
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ `lsb_release -c -s`-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get -y update

RUN apt-get -y --force-yes install ruby1.8 passenger
RUN apt-get -y install libxml2-dev libxslt1-dev postgresql-client libpq-dev

RUN echo "gem: --no-ri --no-rdoc" > /etc/gemrc
RUN gem install bundler

WORKDIR /www

#VOLUME ["/www/public/system"]
