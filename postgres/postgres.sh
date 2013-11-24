#!/bin/bash
set -e

PARAMS="${@}"

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

CMD="${PG_PATH}${PARAMS}"
echo "RUN: ${CMD}"
chown postgres:postgres "$PGDATA"
exec su postgres -c "exec ${CMD}"
