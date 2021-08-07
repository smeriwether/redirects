server {
  listen 80; # managed by Certbot
  server_name .smeriwether.com;
  return 301 https://www.merimerimeri.com$request_uri;
}

server {
  listen 443 ssl; # managed by Certbot

  server_name .smeriwether.com;

  ssl_certificate /etc/letsencrypt/live/smeriwether.com/fullchain.pem; # managed by Certbot
  ssl_certificate_key /etc/letsencrypt/live/smeriwether.com/privkey.pem; # managed by Certbot
  include /etc/letsencrypt/options-ssl-nginx.conf; # managed by Certbot
  ssl_dhparam /etc/letsencrypt/ssl-dhparams.pem; # managed by Certbot

  return 301 https://www.merimerimeri.com$request_uri;
}
