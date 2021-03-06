FROM gliderlabs/alpine:3.4

MAINTAINER Alex McAuley "alex@nodex.co.uk"

RUN apk-install openjdk8-jre tini su-exec

ENV ELASTIC 1.7.6

RUN apk-install -t build-deps wget ca-certificates \
  && cd /tmp \
  && wget -O elasticsearch-$ELASTIC.tar.gz https://download.elastic.co/elasticsearch/elasticsearch/elasticsearch-$ELASTIC.tar.gz \
  && tar -xzf elasticsearch-$ELASTIC.tar.gz \
  && mv elasticsearch-$ELASTIC /usr/share/elasticsearch \
  && adduser -DH -s /sbin/nologin elasticsearch \
	&& echo "Creating Elasticsearch Paths..." \
	&& for path in \
    /usr/share/elasticsearch/snapshots \
		/usr/share/elasticsearch/data \
		/usr/share/elasticsearch/logs \
		/usr/share/elasticsearch/config \
		/usr/share/elasticsearch/config/scripts \
		/usr/share/elasticsearch/plugins \
	; do \
	mkdir -p "$path"; \
	done \
  && chown -R elasticsearch:elasticsearch /usr/share/elasticsearch \
  && rm -rf /tmp/* \
  && apk del --purge build-deps

COPY elasticsearch.yml /usr/share/elasticsearch/config
COPY docker-entrypoint.sh /

ENV PATH /usr/share/elasticsearch/bin:$PATH

VOLUME ["/usr/share/elasticsearch/data"]

EXPOSE 9200 9300

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["elasticsearch"]