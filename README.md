Gogs proxy
==========

This image runs a ssh proxy and nginx reverse proxy for gogs so it can run on port 80 and 22


SSH will require linking gogs container with a name "gogs" so ssh can connect and a private key that should be placed in /root/.ssh directory by mounting a volume from a host machine that has an access to git user on gogs. Additionally a public key for this user has to be placed in googs authorized_keys file that's in /data/git/.ssh/authorized_keys. Script assumes gogs SSH runs on default port 222. Logging is in verbose mode and sent to /data/ssh-proxy.log


Nginx runs reverse proxy on root location using gogs as the name for the linked container on port 3000
