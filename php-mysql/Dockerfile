FROM mikz/base:precise
MAINTAINER Michal Cichra <michal.cichra@gmail.com>

VOLUME ["/var/lib/mysql", "/www"]
RUN cat /proc/mounts > /etc/mtab

ENV MARIADB_VERSION 5.5

RUN apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 0xcbcb082a1bb943db
RUN echo "deb http://ftp.osuosl.org/pub/mariadb/repo/$MARIADB_VERSION/ubuntu precise main" >> /etc/apt/sources.list.d/mariadb.list

RUN apt-key adv --keyserver keyserver.ubuntu.com --recv-keys C300EE8C
RUN echo "deb http://ppa.launchpad.net/nginx/stable/ubuntu precise main" > /etc/apt/sources.list.d/nginx.list

RUN apt-get -y update

RUN apt-get -y install mariadb-client mariadb-server
RUN echo "[mysqld]\nbind-address = 0.0.0.0" > /etc/mysql/conf.d/listen.cnf

RUN apt-get -y install php5-fpm php5-mysqlnd nginx

RUN rm /etc/nginx/sites-enabled/default
ADD config /etc/nginx/sites-enabled/
ADD fastcgi_params /etc/nginx/

EXPOSE 80

CMD service nginx start && service php5-fpm start && service mysql start && tail -F /var/log/nginx/*.log
