FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-add-repository -y ppa:brightbox/ruby-ng

RUN apt-get -y update

RUN apt-get -y install ruby1.9.3 rubygems
RUN apt-get -y install curl libxml2-dev libxslt1-dev postgresql-client libpq-dev

RUN echo "gem: --no-ri --no-rdoc" > /etc/gemrc

RUN gem install passenger bundler

WORKDIR /www
