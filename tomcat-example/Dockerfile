FROM tomcat:9-jre8-alpine

RUN apk add --no-cache curl \
    && curl -OL https://tomcat.apache.org/tomcat-9.0-doc/appdev/sample/sample.war  \
    && mv sample.war ${CATALINA_HOME}/webapps \
    && rm -rf ${CATALINA_HOME}/webapps/examples ${CATALINA_HOME}/webapps/docs \
        ${CATALINA_HOME}/webapps/ROOT ${CATALINA_HOME}/webapps/host-manager \
        ${CATALINA_HOME}/RELEASE-NOTES ${CATALINA_HOME}/RUNNING.txt \
        ${CATALINA_HOME}/bin/*.bat  ${CATALINA_HOME}/bin/*.tar.gz \
        ${CATALINA_HOME}/webapps/manager
        
EXPOSE 8080