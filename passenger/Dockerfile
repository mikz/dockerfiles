FROM mikz/hosting:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN apt-add-repository -y ppa:brightbox/ruby-ng \
 && apt-get -q -y update \
 && apt-get -q -y install ruby1.9.3 rubygems \
 && apt-cleanup

RUN gem install passenger bundler

WORKDIR /www

ONBUILD ADD . /www
ONBUILD ADD config/docker/ /www/config
ONBUILD RUN bundle install --deployment --without test development --jobs `$NUM_CPU`

ENV RAILS_ENV production
ENTRYPOINT ["passenger", "start"]

EXPOSE 3000
