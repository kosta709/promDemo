#!/usr/bin/env bash


INSTALL_DOCKER=$(! which docker &> /dev/null && echo 'true' || echo 'false')
INSTALL_COMPOSE=$(! which docker-compose &> /dev/null && echo 'true' || echo 'false')

if [[ $INSTALL_DOCKER == 'true' ]]; then
   echo -e "\n------------------\nInstalling docker ... "
   curl -sSL https://get.docker.com/ | sudo sh -
   usermod -aG docker vagrant
else
   echo "Docker is already installed"
fi


if [[ $INSTALL_COMPOSE == 'true' ]]; then
   echo -e "\n------------------\nInstalling docker-compose ... "
  curl -L https://github.com/docker/compose/releases/download/1.12.0/docker-compose-`uname -s`-`uname -m` > /usr/local/bin/docker-compose
  chmod +x /usr/local/bin/docker-compose
else
   echo "docker-compose is already installed"
fi

docker run --name=cadvisor --publish=8080:8080 --restart always  --detach=true \
  --volume=/:/rootfs:ro --volume=/var/run:/var/run:rw --volume=/sys:/sys:ro --volume=/var/lib/docker/:/var/lib/docker:ro \
  -l io.codefresh.owner=codefresh -l io.codefresh.visibility=internal google/cadvisor:v0.26.1
