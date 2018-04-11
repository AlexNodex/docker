#!/bin/bash

docker build -t nodextechnology/elasticsearch:2.4-alpine docker/elasticsearch/2.4
docker build -t nodextechnology/elasticsearch:1.7.6-alpine docker/elasticsearch/1.7.6

docker push nodextechnology/elasticsearch:2.4-alpine
docker push nodextechnology/elasticsearch:1.7.6-alpine