#!/usr/bin/env bash

# install and/or reload ntp daemon

apt-get -y install ntp
service ntp reload

# setup correct timezone
echo "Europe/Zurich" > /etc/timezone
dpkg-reconfigure -f noninteractive tzdata

# ruby gems
gem install chunky_png

