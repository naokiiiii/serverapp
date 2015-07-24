#!/bin/bash
#
# docker run serverapp-test
#
if [ "$GIT_HOME" = "" ]; then
    echo "GIT_HOME must be set. exit."
    exit 1
fi

if [ ! -e $GIT_HOME/chainer-data ]; then
    mkdir -p $GIT_HOME/chainer-data
fi

cd $GIT_HOME/chainer-data

[ -e mstimages ] || mkdir mstimages
[ -e images ] || mkdir images
[ -e model ] || mkdir model
[ -e tmpimages ] || mkdir tmpimages

docker run --name serverapp-test-up -i -t -d -p 8080:8080 -p 8888:8888 \
  -v $GIT_HOME/serverapp:/opt/t4j/serverapp \
  -v $GIT_HOME/chainer-data:/var/opt/t4j/chainer-data \
  t4j/serverapp-test:latest

exit 0
