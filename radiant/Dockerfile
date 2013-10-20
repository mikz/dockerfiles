FROM mikz/passenger:1.8
MAINTAINER Michal Cichra <michal@cichra.cz>

RUN apt-get -y install git imagemagick libmagickwand-dev
ENTRYPOINT ["bundle", "exec", "passenger", "start"]
