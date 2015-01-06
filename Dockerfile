FROM debian:wheezy

MAINTAINER Oswald Johnson <oswald.johnson@gsa.gov>

ENV DEBIAN_FRONTEND noninteractive

# Install Nginx.
RUN \
  echo "deb http://ppa.launchpad.net/nginx/stable/debian wheezy main" > /etc/apt/sources.list.d/nginx  && \
  apt-get update && \
  apt-get install -y nginx && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

# Define working directory.
WORKDIR /etc/nginx

# Define default command.
CMD ["nginx"]

# Expose ports.
EXPOSE 80
EXPOSE 443
