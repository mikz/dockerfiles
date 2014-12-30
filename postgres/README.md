# PostgreSQL

Preconfigured Docker Image with Postgresql 9.3.

Has a configured volume /data which is initialized with new postgres database if not mounted from another machine or host system.

## Creating a hot slave

```shell
docker create --name postgres mikz/postgres
docker run -it --volumes-from postgres mikz/postgres bash

$ rm -rf /data/*
$ pg_basebackup -h yourserver -U replicator -v -P -D /data
$ echo "standby_mode = 'on'" > /data/recovery.conf
$ echo "primary_conninfo = 'host=yourserver port=5432 user=replicator password=password sslmode=require'" >> /data/recovery.conf
$ echo "trigger_file = '/data/postgresql.trigger'" >> /data/recovery.conf
$ chown -vfR postgres:postgres /data
$ chmod 0700 /data
$ exit

docker start postgres
```

And the postgres will start as new hot slave.
