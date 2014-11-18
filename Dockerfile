FROM phusion/baseimage:0.9.13
MAINTAINER Stan Bondi <stan@fixate.it>

# Install MongoDB.
RUN \
  apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv 7F0CEB10 && \
  echo 'deb http://downloads-distro.mongodb.org/repo/ubuntu-upstart dist 10gen' | tee /etc/apt/sources.list.d/mongodb.list && \
  apt-get update && \
  apt-get install -y mongodb-org=2.6.5 && \
  mkdir -p /var/mongodb/data && \
  apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


ADD scripts/ /tmp/docker/
RUN mkdir -p /etc/service/mongodb && \
  cp /tmp/docker/mongodb.sh /etc/service/mongodb/run && \
  chmod +x /etc/service/mongodb/run
RUN mkdir -p /etc/mongodb && cp -p /tmp/docker/mongodb.conf /etc/mongodb/

# Define mountable directories.
VOLUME ["/var/mongodb/data"]
VOLUME ["/var/mongodb/log"]

# Define working directory.
WORKDIR /var/mongodb/data

# Define default command.
CMD ["/sbin/my_init"]

# Expose ports.
#   - 27017: process
#   - 28017: http
EXPOSE 27017
EXPOSE 28017


