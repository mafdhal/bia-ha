#!/bin/bash


  # Install Node-red
  apt-get install curl python-software-properties
  curl -sL https://deb.nodesource.com/setup_8.x | sudo -E bash -
  apt-get install nodejs
  npm install -g --unsafe-perm node-red
  npm install -g pm2
  # pm2 start /usr/bin/node-red 