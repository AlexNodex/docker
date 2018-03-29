FROM ubuntu:16.04
MAINTAINER Alex McAuley "alex@nodex.co.uk"

# Install java
ENV DEBIAN_FRONTEND noninteractive
ENV JAVA_VERSION_MAJOR=8 \
    JAVA_VERSION_MINOR=111 \
    JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin/

RUN apt-get update && \
    apt-get install -y software-properties-common && \
    apt-get update && \
    add-apt-repository ppa:openjdk-r/ppa -y && \
    apt-get update && \
    apt-get install -y tar wget curl && \
    apt-get install -y --no-install-recommends openjdk-8-jre-headless && \

   # fix default setting
    ln -s java-8-openjdk-amd64 /usr/lib/jvm/default-jvm && \
    apt-get clean all

ENV SOLR_VERSION 5.1.0
RUN mkdir -p /opt && \
    wget -nv http://archive.apache.org/dist/lucene/solr/$SOLR_VERSION/solr-$SOLR_VERSION.tgz -O /opt/solr-$SOLR_VERSION.tgz && \
    tar -C /opt --extract --file /opt/solr-$SOLR_VERSION.tgz && \
    mv /opt/solr-$SOLR_VERSION /opt/solr && \
    rm -rf /opt/solr-$SOLR_VERSION.tgz /opt/solr-$SOLR_VERSION
#COPY ./solr.xml /opt/solr/server/solr.xml
#RUN mkdir -p /opt/solr/server/solr-webapp/webapp/WEB-INF/lib

#RUN wget -nv https://github.com/AlexNodex/solrjts/blob/master/jts-1.14.jar -O /opt/solr/server/solr-webapp/webapp/WEB-INF/lib/jts-1.14.jar

#
# Start solr
WORKDIR /opt/solr/server
EXPOSE 8080
CMD [ "/usr/bin/java", "-Dsolr.solr.home=/opt/solr/server/solr", "-jar", "/opt/solr/server/start.jar" ]
