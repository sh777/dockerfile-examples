FROM alpine:3.10

LABEL Author="Michael Huang(withoutbug@gmail.com)"
LABEL org.label-schema.docker.cmd="docker run -p 10088:10088 -d sh777/v2ray:latest"

WORKDIR /root

ARG TZ="Asia/Shanghai"

ENV V2RAY_VERSION v4.23.1
ENV V2RAY_DOWNLOAD_URL=https://github.com/v2ray/v2ray-core/releases/download/${V2RAY_VERSION}/v2ray-linux-64.zip
ENV V2RAY_PORT 10088


RUN apk add --no-cache curl unzip tzdata

#Install v2ray
RUN curl -OL ${V2RAY_DOWNLOAD_URL} && \
    mkdir /etc/v2ray && \
    unzip /root/v2ray-linux-64.zip -d /etc/v2ray && \
    rm /root/v2ray-linux-64.zip && \
    chmod +x /etc/v2ray/v2ray && \
    ln -sf /usr/share/zoneinfo/${TZ} /etc/localtime && \
    echo ${TZ} > /etc/timezone

#config v2ray
ADD config.json /etc/v2ray/config.json
RUN chmod 644 /etc/v2ray/config.json 

EXPOSE ${V2RAY_PORT}

ENTRYPOINT [ "/etc/v2ray/v2ray", "--config", "/etc/v2ray/config.json" ]
