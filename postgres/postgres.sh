#!/bin/bash
set -e

CMD="${@}"

if [ -z "$PG_VERSION" ]
  then
    echo "No pg version supplied"
    exit 1
fi

PG_PATH="/usr/lib/postgresql/${PG_VERSION}/bin/"

if [ -z "$1" ]
  then
    echo "No argument supplied. Use one of:"
    ls ${PG_PATH}
    exit 1
fi

if [ "$(ls -A "$PGDATA")" ]
  then
    echo "$PGDATA is not empty, continuing"
  else if [ "$1" != "initdb" ]
    then
      echo "$PGDATA is empty, will initialize it"
      ./$0 initdb
      echo "listen_addresses = '*'" >> $PGDATA/postgresql.conf
    fi
fi

echo "RUN: ${CMD}"

if [ "$(whoami)" == "root" ]
  then
    chown postgres:postgres "$PGDATA"
    exec su postgres -c "PATH=\"$PG_PATH:\$PATH\" exec ${CMD}"
  else
    PATH="$PG_PATH:$PATH" exec $CMD
fi
