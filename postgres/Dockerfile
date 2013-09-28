FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN apt-get -y install wget
RUN wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
RUN echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

RUN apt-get -y update

ENV LOCALE cs_CZ
ENV PG_VERSION 9.3

RUN apt-get install -y postgresql-$PG_VERSION postgresql-client-$PG_VERSION postgresql-contrib-$PG_VERSION
# RUN apt-get install -y language-selector-common
# RUN apt-get install -y $(check-language-support --language=$LOCALE)
RUN /usr/share/locales/install-language-pack $LOCALE

VOLUME ["/data"]
ENV PGDATA /data

RUN mkdir -p $PGDATA
RUN chown postgres:postgres $PGDATA

ADD postgres.sh /root/postgres.sh
ENTRYPOINT ["/root/postgres.sh"]
CMD ["postgres"]
EXPOSE 5432
