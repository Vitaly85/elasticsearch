#Elasticsearch 1.4.4

FROM dockerfile/java:oracle-java8

MAINTAINER Yury Kavaliou <Yury_Kavaliou@epam.com>

ENV ES_VERSION 1.4.4

#Install elasticsearch
RUN cd / \
	&& curl -O https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-$ES_VERSION.tar.gz \
	&& tar xzf elasticsearch-$ES_VERSION.tar.gz \
	&& rm -f elasticsearch-$ES_VERSION.tar.gz \
	&& mv elasticsearch-$ES_VERSION /elasticsearch

COPY elasticsearch.yml /elasticsearch/config/elasticsearch.yml
COPY logging.yml /elasticsearch/config/logging.yml

VOLUME ["/data", "/logs"]

ENTRYPOINT ["/elasticsearch/bin/elasticsearch"]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
