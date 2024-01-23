# !/bin/bash

unlink /etc/nginx/sites-enabled/default

ln -s /etc/nginx/sites-available/mynginx /etc/nginx/sites-enabled/mynginx

openssl req -newkey rsa:4096 -days 365 -nodes -x509 -subj "/C=KR/ST=Seoul/L=Seoul/O=42Seoul/OU=Cadet/CN=woosekim" -keyout /etc/ssl/private/nginx.key -out /etc/ssl/certs/nginx.crt

chmod 600 /etc/ssl/certs/nginx.crt /etc/ssl/private/nginx.key

nginx -g 'daemon off;'