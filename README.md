Elasticsearch
==============

Installation
--------------

1. Install [Docker](https://www.docker.com)

2. Download automated build from public Docker Hub Registry: `docker pull qapps/elasticsearch`
(alternatively, you can build an image from Dockerfile: `docker build -t="qapps/elasticsearch" github.com/qualiapps/elasticsearch`)

Running the daemon
-----------------

`docker run -d -p 9200:9200 -p 9300:9300 --name elasticsearch qapps/elasticsearch`

Attach persistent/shared directories
-----------------

1. Create a mountable data directory <data-dir> on the host.

2. Start a container by mounting data directory:

	`docker run -d -p 9200:9200 -p 9300:9300 -v <data-dir>:/data qapps/elasticsearch`

