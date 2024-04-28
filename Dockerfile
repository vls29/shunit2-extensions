FROM ubuntu:24.04

ARG SHUNIT2_VERSION=2.1.8
ADD https://github.com/kward/shunit2/archive/refs/tags/v${SHUNIT2_VERSION}.tar.gz /tmp/
ADD src/bash/test-runner.sh /usr/local/bin/test-runner

RUN cd /tmp \
    && tar -zxvf v${SHUNIT2_VERSION}.tar.gz \
    && ls -la /tmp/ \
    && cp /tmp/shunit2-${SHUNIT2_VERSION}/shunit2 /usr/local/bin/ \
    && ls -la /usr/local/bin \
    && shunit2 \
    && rm -rf /tmp/* \
    && ls -la /mnt

WORKDIR /mnt

ENTRYPOINT test-runner