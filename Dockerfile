FROM fedora:21

MAINTAINER Yury Kavaliou <test@test.com>

RUN yum install -y java

# Install elasticsearch
RUN yum install -y https://download.elasticsearch.org/elasticsearch/elasticsearch/elasticsearch-1.4.2.noarch.rpm

ADD elasticsearch.yml /usr/share/elasticsearch/elasticsearch.yml
ADD logging.yml /usr/share/elasticsearch/logging.yml

ENTRYPOINT ["/usr/share/elasticsearch/bin/elasticsearch"]
CMD [""]

# Expose ports.
#   - 9200: HTTP
#   - 9300: transport
EXPOSE 9200
EXPOSE 9300
