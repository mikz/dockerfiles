FROM ubuntu:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN apt-get -y update
RUN apt-get -y install software-properties-common python-software-properties
RUN apt-add-repository -y ppa:brightbox/ruby-ng
RUN echo "deb http://archive.ubuntu.com/ubuntu/ `lsb_release -c -s` universe" >> /etc/apt/sources.list
# RUN echo "deb https://oss-binaries.phusionpassenger.com/apt/passenger `lsb_release -c -s` main" >> /etc/apt/sources.list

RUN apt-get -y update
RUN apt-get -y upgrade

RUN apt-get -y install wget curl
RUN wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get -y update

RUN apt-get -y install ruby1.9.3 rubygems
RUN apt-get -y install libxml2-dev libxslt1-dev postgresql-client libpq-dev


RUN gem install bundler --no-rdoc --no-ri
RUN echo "gem: --no-ri --no-rdoc" > /etc/gemrc

# ADD . /www
WORKDIR /www

# RUN bundle install
ENV RAILS_ENV production

RUN gem install passenger bundler

ENTRYPOINT ["passenger"]
CMD ["start"]
EXPOSE 3000
