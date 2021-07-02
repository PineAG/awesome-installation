#!/usr/bin/env bash

cd "$(dirname $0)"

if [ -d build ]; then
    rm -rf build
fi
mkdir build
mkdir build/resources

curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o build/resources/docker-ubuntu-gpg
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-Linux-x86_64" -o build/resources/docker-compose
curl -L https://raw.githubusercontent.com/docker/compose/1.29.2/contrib/completion/bash/docker-compose -o build/resources/docker-compose-completion

cp ./install-standalone.sh ./build/resources/install-standalone.sh

tar -zcvf build/resources.tgz build/resources

cat head.sh build/resources.tgz > build/standalone.sh
chmod +x build/standalone.sh
