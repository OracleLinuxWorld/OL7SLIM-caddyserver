FROM oraclelinux:7-slim
LABEL maintainer="Johan Louwers <louwersj@gmail.com>"

RUN mkdir -p /etc/caddy &&\ 
useradd -u 1001 -g 0 caddy 

RUN curl https://caddyserver.com/download/linux/amd64?plugins=http.authz,http.cors&license=personal&telemetry=off /usr/bin/caddy

RUN curl https://github.com/OracleLinuxWorld/OL7SLIM-caddyserver/raw/master/Caddyfile /etc/caddy/Caddyfile
RUN chmod 0755 /usr/bin/caddy
RUN mkdir -p /var/www/html
RUN chown -R 1001:0 /var/www
RUN chmod -R 777 /var/www
RUN chmod -R g+s /var/www
RUN chown -R 1001:0 /etc/caddy
RUN chmod -R 775 /etc/caddy

USER 1001

EXPOSE 80 
#443 2015 8080 8443

WORKDIR /var/www/html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-quic" ,"--conf", "/etc/caddy/Caddyfile"]
