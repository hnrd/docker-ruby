FROM debian:stable

ADD ruby-1.9.3-p448.tar.bz2 /ruby/
WORKDIR /ruby/ruby-1.9.3-p448/

RUN apt-get update && \
  apt-get install -y build-essential libncurses5-dev libffi-dev openssl zlib1g-dev && \
  /bin/bash ./configure && \
  make && \
  make install && \
  apt-get purge -y build-essential libncurses5-dev libffi-dev openssl zlib1g-dev && \
  apt-get autoremove -y && \
  apt-get purge -y $(dpkg --get-selections | grep deinstall | awk '{print $1}') && \
  apt-get clean all && \
  rm -rf /ruby/
