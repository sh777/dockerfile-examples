FROM nginx

### install Filebeat
ENV FILEBEAT_VERSION 6.4.0

RUN apt-get update -qq \
 && apt-get install -qqy curl \
 && apt-get clean

 RUN curl -L -O https://artifacts.elastic.co/downloads/beats/filebeat/filebeat-${FILEBEAT_VERSION}-amd64.deb \
 && dpkg -i filebeat-${FILEBEAT_VERSION}-amd64.deb \
 && rm filebeat-${FILEBEAT_VERSION}-amd64.deb

# remove log symlinks
RUN rm /var/log/nginx/access.log /var/log/nginx/error.log

 # configure
ADD filebeat.yml /etc/filebeat/filebeat.yml
RUN chmod 644 /etc/filebeat/filebeat.yml

# demo page
# COPY html /usr/share/nginx/html

ADD ./start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh
CMD [ "/usr/local/bin/start.sh" ]