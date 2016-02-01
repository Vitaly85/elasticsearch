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
cd /opt

echo "#######################"
echo "Start unzip"
echo "#######################"
unzip 'elasticsearch-2.2.0-SNAPSHOT.zip'
echo "#######################"
echo "Unzip Ok"
echo "#######################"
if [ ! -d /elasticsearch ] ; then
	echo "Create elasticsearch directory"
	mkdir /elasticsearch
fi
mv -vf '/opt/elasticsearch-2.2.0-SNAPSHOT/'* /elasticsearch
chown -R elastic /elasticsearch
chown -R elastic /data
echo "#######################"
echo "Elastic installed OK"
echo "#######################"
