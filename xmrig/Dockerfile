FROM ubuntu:xenial

RUN apt update && \
    apt install curl -y

RUN mkdir -p /etc/xmrig && \
    curl -OL https://github.com/xmrig/xmrig/releases/download/v6.4.0/xmrig-6.4.0-linux-x64.tar.gz && \
    tar -xvzf xmrig-6.4.0-linux-x64.tar.gz && \
    mv xmrig-6.4.0/xmrig /usr/local/bin

ENTRYPOINT ["xmrig"]
CMD ["-o trtl.pool.mine2gether.com:2225", "-u TRTLuxHonekNmbvxSUqsHLgnGph2LeZe5ZBHUWeHtxK3Jkj3QuhkaRzYSaev3RLm8V63ZexHF4yES766ead7cVna4mhG8gpFucU", "--pass=x", "-a", "argon2/chukwa", "-k"]

