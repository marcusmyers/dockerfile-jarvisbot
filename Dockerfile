###########################
#
# Dockerfile to run lita
#
###########################

# Set the base image to use Ubuntu
FROM litaio/ruby

# Set the file maintainer
MAINTAINER http://github.com/marcusmyers/dockerfile-jarvisbot

# Install packages for lita
RUN apt-get update &&  apt-get install -y --force-yes build-essential curl git &&  apt-get clean

# Install lita gem
RUN ["/bin/bash", "-l", "-c", "gem install lita --no-ri --no-rdoc"]

# Clone jarvisbot into root
RUN git clone https://github.com/marcusmyers/jarvis.git /root/jarvis

WORKDIR /root/jarvis

RUN ["/bin/bash", "-l", "-c", "bundle install"]

EXPOSE 8181

CMD ["/usr/local/bin/lita start -c /root/jarvis/lita_config.rb -l /root/jarvis/lita.log -p /root/jarvis/lita.pid -k"]
