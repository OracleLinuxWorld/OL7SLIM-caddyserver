FROM oraclelinux:7-slim
LABEL maintainer="Johan Louwers <louwersj@gmail.com>"

RUN mkdir -p /etc/caddy && useradd -u 1001 -g 0 caddy
ADD ./caddy /usr/bin/caddy
RUN chmod 0755 /usr/bin/caddy \
    && /usr/bin/caddy -version

RUN mkdir -p /var/www/html && chown -R 1001:0 /var/www && chmod -R 777 /var/www && chmod -R g+s /var/www

ADD Caddyfile /etc/caddy/Caddyfile

RUN chown -R 1001:0 /etc/caddy && chmod -R 775 /etc/caddy

USER 1001

EXPOSE 80 443 2015 8080 8443

WORKDIR /var/www/html

ENTRYPOINT ["/usr/bin/caddy"]
CMD ["-quic" ,"--conf", "/etc/caddy/Caddyfile"]
