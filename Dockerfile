FROM oraclelinux:7-slim
LABEL maintainer="Johan Louwers <louwersj@gmail.com>"


RUN mkdir -p /etc/caddy &&\ 
useradd -u 1001 -g 0 caddy &&\
yum -y install tar &&\
yum -y install gzip &&\
curl -so /tmp/caddy 'https://caddyserver.com/download/linux/amd64?plugins=http.authz,http.cors&license=personal&telemetry=off' &&\
tar -xzf /tmp/caddy &&\
mv /tmp/caddy /usr/bin/caddy &&\
curl -so /etc/caddy/Caddyfile https://raw.githubusercontent.com/OracleLinuxWorld/OL7SLIM-caddyserver/master/Caddyfile &&\
chmod 0755 /usr/bin/caddy &&\
mkdir -p /var/www/html &&\
chown -R 1001:0 /var/www &&\
chmod -R 777 /var/www &&\
chmod -R g+s /var/www &&\
chown -R 1001:0 /etc/caddy &&\
chmod -R 775 /etc/caddy &&\
rm -rf /tmp/* &&\
yum clean all


USER 1001


EXPOSE 80 
#443 2015 8080 8443

WORKDIR /var/www/html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-quic" ,"--conf", "/etc/caddy/Caddyfile"]
