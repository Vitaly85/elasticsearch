#Elasticsearch 2.2

FROM registry.hub.docker.com/java:8-jdk
FROM fedora:20

MAINTAINER Yury Kavaliou <Yury_Kavaliou@epam.com>

ENV ES_VERSION 1.4.4

#Install elasticsearch
RUN cd / \
	&& cd /opt \
	&& yum install -y unzip \
	&& yum install -y maven \
	&& yum install -y hostname \
	&& useradd -G root elastic \
	&& curl -O -L -J https://github.com/elastic/elasticsearch/archive/2.2.zip \
	&& unzip elasticsearch-2.2.zip \
	&& rm *.zip \
	&& chown -R elastic elasticsearch-2.2 \
	&& cd elasticsearch-2.2 \
	&& chmod +x run.sh

COPY elasticsearch.sh /usr/local/bin/elasticsearch.sh

RUN chmod +x /usr/local/bin/elasticsearch.sh
RUN mkdir /elasticserch
RUN /usr/local/bin/elasticsearch.sh
COPY elasticsearch.yml /elasticsearch/config/elasticsearch.yml
COPY logging.yml /elasticsearch/config/logging.yml

VOLUME ["/data", "/logs"]

ENTRYPOINT ["su", "-c", "/elasticsearch/bin/elasticsearch", "elastic"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
