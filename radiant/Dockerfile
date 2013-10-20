FROM mikz/passenger:1.8
MAINTAINER Michal Cichra <michal@cichra.cz>

RUN apt-get -y install git imagemagick libmagickwand-dev
ENV RAILS_ENV production
ENTRYPOINT ["bundle", "exec", "passenger", "start"]
