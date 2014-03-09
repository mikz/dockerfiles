FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

RUN wget -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add - \
 && echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > /etc/apt/sources.list.d/pgdg.list

ENV LOCALE cs_CZ
ENV PG_VERSION 9.3

VOLUME ["/data"]
ENV PGDATA /data

RUN apt-get -q -y update \
 && apt-get install -q -y postgresql-$PG_VERSION postgresql-client-$PG_VERSION postgresql-contrib-$PG_VERSION \
 && /usr/share/locales/install-language-pack $LOCALE \
 && apt-get install -q -y supervisor \
 && apt-cleanup

# why these are commented?
# RUN apt-get install -y language-selector-common
# RUN apt-get install -y $(check-language-support --language=$LOCALE)

RUN mkdir -p $PGDATA \
 && chown postgres:postgres $PGDATA

ADD postgres.sh /var/lib/postgresql/postgres.sh
RUN chmod +x /var/lib/postgresql/postgres.sh
ADD supervisord.conf /etc/supervisor/supervisord.conf

CMD ["supervisord"]

EXPOSE 5432
