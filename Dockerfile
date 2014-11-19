###########################
#
# Dockerfile to run lita
#
###########################

# Set the base image to use Ubuntu
FROM ubuntu

# Set the file maintainer
MAINTAINER http://github.com/marcusmyers

# Install packages for lita
RUN apt-get update
RUN apt-get install -y --force-yes build-essential curl git
RUN apt-get install -y --force-yes ruby
RUN apt-get clean

# Install lita gem
RUN echo 'gem install lita'

# Create Jarvis directory
RUN echo 'mkdir -p /root/jarvis'
