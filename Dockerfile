FROM nginx:1.11.4-alpine
RUN mkdir -p /opt/bin
RUN apk update
RUN apk add curl bash net-tools wget git openssh-client ca-certificates
VOLUME /root/.ssh
COPY run.sh /root/run.sh
COPY nginx.conf /etc/nginx/nginx.conf
CMD ["/bin/bash", "/root/run.sh"]
