#!/usr/bin/bash
if [ -f /elasticsearch/bin/elasticsearch ] ;then
    echo elastic ulready exists
    exit 0
fi
set -e
echo "#######################"
echo "elasticsearch build"
echo "#######################"
cd /opt/elasticsearch-2.2/ && su -c 'mvn clean package -DskipTests' elastic
echo "#######################"
echo "elasticsearch build OK" 
echo "#######################"
cp  /opt/elasticsearch-2.2/distribution/zip/target/releases/elasticsearch-2.2.0-SNAPSHOT.zip /opt
unzip /opt/elasticsearch-2.2.0-SNAPSHOT.zip
cp -r /opt/elasticsearch-2.2.0-SNAPSHOT/* /elasticsearch
rm /opt/*zip
chown -R elastic /elasticsearch
