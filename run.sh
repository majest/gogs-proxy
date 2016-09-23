mkdir /data
rm -fr /data/ssh-proxy.log
ssh -f -N -o ServerAliveInterval=30 -L0.0.0.0:22:localhost:22 git@gogs
nginx
