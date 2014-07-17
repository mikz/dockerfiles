# Transmission in Docker

Check Makefile for which ports to export and where to mount a volume. 
Mouting volume is not required. But you probably want it on different parititon.

OpenSSH in the transmission container will load `.ssh/authorized_keys` from that volume and allow you chrooted sftp access.
Also Transmission will load `.config/settings.json` which is Transsmision daemon settings. You can have there something like:

```json
{
"rpc-whitelist-enabled": false
,"rpc-username": "user"
,"rpc-password": "password"
,"rpc-authentication-required": true
,"watch-dir-enabled": true
,"watch-dir": "/mnt/storage/watch"
,"trash-original-torrent-files": true
,"download-dir": "/mnt/storage/downloads"
}
```

For more settings check https://trac.transmissionbt.com/wiki/EditConfigFiles
