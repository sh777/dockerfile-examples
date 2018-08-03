FROM tomcat:9-jre8-alpine

ENV FILEBEAT_VERSION 6.3.0-linux-x86_64
ENV FILEBEAT_DOWNLOAD_URL=https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}.tar.gz


RUN apk add --no-cache curl libc6-compat \
    && curl -OL https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war  \
    && mv sample.war ${CATALINA_HOME}/webapps \
    && rm -rf ${CATALINA_HOME}/webapps/examples ${CATALINA_HOME}/webapps/docs \
        ${CATALINA_HOME}/webapps/ROOT ${CATALINA_HOME}/webapps/host-manager \
        ${CATALINA_HOME}/RELEASE-NOTES ${CATALINA_HOME}/RUNNING.txt \
        ${CATALINA_HOME}/bin/*.bat  ${CATALINA_HOME}/bin/*.tar.gz \
        ${CATALINA_HOME}/webapps/manager
    
#Install filebeat
RUN curl -s ${FILEBEAT_DOWNLOAD_URL} | tar zx -C /tmp && \
    mkdir /etc/filebeat && mv /tmp/filebeat-${FILEBEAT_VERSION}/* /etc/filebeat

#config filebeat
ADD filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod 644 /etc/filebeat/filebeat.yml

# add tomcat configuration
ADD server.xml /usr/local/tomcat/conf/
ADD logging.properties /usr/local/tomcat/conf/

EXPOSE 8080

# Staup script
ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]