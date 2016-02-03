FROM gliderlabs/alpine:3.3

LABEL name="zookeeper" version="3.4.6"

RUN apk-install openjdk7-jre wget bash 
RUN mkdir /opt \
    && wget -q -O - http://archive.apache.org/dist/zookeeper/zookeeper-3.4.5/zookeeper-3.4.5.tar.gz | tar -xzf - -C /opt \
    && mv /opt/zookeeper-3.4.5 /opt/zookeeper \
    && cp /opt/zookeeper/conf/zoo_sample.cfg /opt/zookeeper/conf/zoo.cfg \
    && mkdir -p /tmp/zookeeper

ENV JAVA_HOME /usr/lib/jvm/java-1.7-openjdk

WORKDIR /opt/zookeeper
ADD start.sh /usr/local/bin/
CMD ["/usr/local/bin/start.sh"]
