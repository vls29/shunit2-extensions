FROM ubuntu:22.04

ADD https://github.com/kward/shunit2/archive/refs/tags/v2.1.8.tar.gz /tmp/
ADD src/bash/test-runner.sh /usr/local/bin/test-runner

RUN cd /tmp \
    && tar -zxvf v2.1.8.tar.gz \
    && ls -la /tmp/ \
    && cp /tmp/shunit2-2.1.8/shunit2 /usr/local/bin/ \
    && ls -la /usr/local/bin \
    && shunit2 \
    && rm -rf /tmp/* \
    && ls -la /mnt

WORKDIR /mnt

ENTRYPOINT test-runner
