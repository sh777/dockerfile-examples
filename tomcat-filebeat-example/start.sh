#!/bin/bash

catalina.sh start
/etc/filebeat/filebeat -e -c /etc/filebeat/filebeat.yml