# OL7SLIM-caddyserver
This is a dockerfile for Caddy Server. Everything is loaded into /var/www/html directory. The Caddyfile is put into /etc/caddy/Caddyfile By default, content present inside /var/www/html will be served over web on the port 2015. Ports 80, 443, 8080 and 8443 are also exposed.

detailed information on Caddyserver can be found at https://caddyserver.com

## plugins
Caddy server plugins installed by default. List of installed plugins is available in ‘plugin_list’ file in same directory. For reference :

#### http.login
github.com/casbin/caddy-authz

#### http.cors
github.com/captncraig/cors

## Caddy Server Configuration
A default caddyserver config file is loaded into container. To overwrite default caddy file in a built container, you can mount your own at /etc/caddy/Caddyfile, however you are responsible for setting appropriate permissions.

Some of the plugins are installed, but not configured by default as they may have application specific settings. You can read more about how to create your own Caddyfile at the caddyfile Syntax documentation.

# Code deployment
All the code you do want to deploy within the Caddy Server needs to be deployed in /var/www which is the root directory for Caddy. All code deployed here will be served by Caddy. 

# Note
Note : the base for this image is taken from registry.centos.org 
