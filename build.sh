#!/bin/bash

docker build -t nodextechnology/elasticsearch:2.4.6-alpine-delete docker/elasticsearch/2.4.6-alpine-delete
docker build -t nodextechnology/elasticsearch:1.7.6-alpine docker/elasticsearch/1.7.6-alpine

docker push nodextechnology/elasticsearch:2.4.6-alpine-delete
docker push nodextechnology/elasticsearch:1.7.6-alpine