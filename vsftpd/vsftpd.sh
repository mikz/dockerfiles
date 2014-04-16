#!/bin/sh

set -e
set -o xtrace

user=${USER:-ftpuser}
password=${PASSWORD:-$(openssl rand -base64 8)}
dir=${DIR:-/ftp}

useradd --home-dir ${dir} --no-create-home $user

echo "$user:$password" | chpasswd
echo "Login info is: $user:$password"

exec ${1:-vsftpd}
