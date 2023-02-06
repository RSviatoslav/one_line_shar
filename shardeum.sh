#!/bin/bash

url="#https://gitlab.com/shardeum/validator/dashboard/-/raw/main/installer.sh"
urlC="https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)"
docker=docker-ce
compose=docker-compose-plugin

        if dpkg -s | grep curl; then
                echo Curl" Installed"
        else
                echo Curl" Not Instaled" && sudo apt-get install curl
        fi
sudo apt update; apt upgrade

        if dpkg -s | grep -q ${docker}; then
                 echo Docker" Installed"
        else
                 echo Docker" Not installed" && sudo apt install docker.io
        fi


        if dpkg -s | grep ${compose}; then
                echo Docker-Compose" Installed" && sudo chmod +x usr/local/bin/docker-compose
        else
                echo Docker-Compose" Not installed" && sudo curl -L ${urlC} -o /usr/local/bin/docker-compose && sudo chmod +x usr/local/bin/docker-compose
        fi

curl -0 ${url} && chmod +x installer.sh && ./installer.sh

echo "All Done"

