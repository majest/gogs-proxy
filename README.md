Gogs proxy
==========

This image runs ssh proxy and nginx reverse proxy for Gogs (https://gogs.io) so that gogs can be accssible on port 80 and 22

SSH will require linking gogs container with a name "gogs" and a private key that should be placed in /root/.ssh directory by mounting a volume from a host machine that has an access to git user on gogs. Additionally a public key for this user has to be placed in googs authorized_keys file that's in /data/git/.ssh/authorized_keys. Script assumes gogs SSH runs on default port 22.

Nginx runs reverse proxy on root location using gogs as the name for the linked container on port 3000

Steps to run:
- Run gogs https://hub.docker.com/r/gogs/gogs/

Add your public key to authorized_keys file (usually  /data/git/.ssh/authorized_keys) inside gogs container. Ideally /data should be mounted on your host machine (Create new key pair using ssh-keygen if needed). Test the connectio

`ssh -p 222 -i ./your_private_key git@gogs_ip`

Run gogs-proxy.

`docker run --link gogs:gogs -d -v $HOME/.ssh:/root/.ssh majest/gogs-proxy`

Check result at:   http://gogs_proxy_ip and `ssh git@gogs_proxy_ip`
