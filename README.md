# OL7SLIM-caddyserver
This is a dockerfile for Caddy Server. Everything is loaded into /var/www/html directory. The Caddyfile is put into /etc/caddy/Caddyfile By default, content present inside /var/www/html will be served over web on the port 2015. Ports 80, 443, 8080 and 8443 are also exposed. Mount your content here with appropriate permissions.

detailed information on Caddyserver can be found at https://caddyserver.com

## plugins
Caddy server plugins installed by default. List of installed plugins is available in ‘plugin_list’ file in same directory. For reference :

#### http.login
github.com/casbin/caddy-authz

#### http.cgi
github.com/jung-kurt/caddy-cgi

#### http.cors
github.com/captncraig/cors

#### http.git
github.com/abiosoft/caddy-git

#### http.datadog
github.com/payintech/caddy-datadog

#### http.cache
github.com/nicolasazrak/caddy-cache

#### http.locale
github.com/simia-tech/caddy-locale

#### http.filter
github.com/echocat/caddy-filter

#### http.ratelimit
github.com/xuqingfeng/caddy-rate-limit

#### http.upload
blitznote.com/src/caddy.upload

#### http.awses
github.com/miquella/caddy-awses

#### http.prometheus
github.com/miekg/caddy-prometheus

## Caddy Server Configuration
A default caddyserver config file is loaded into container. To overwrite default caddy file in a built container, you can mount your own at /etc/caddy/Caddyfile, however you are responsible for setting appropriate permissions.

Some of the plugins are installed, but not configured by default as they may have application specific settings.

You can read more about how to create your own Caddyfile at the caddyfile Syntax documentation.

Note : For docker volume mounts using -v, you might encounter issues with selinux permission denies. Please take nesessary steps to avoid any issues

Note : the base for this image is taken from registry.centos.org 
