FROM debian:stable-slim

WORKDIR /

COPY ./bin/build.sh /
RUN sh /build.sh && rm -f /build.sh
EXPOSE 10110/tcp
ENTRYPOINT ["/usr/local/bin/rtl_ais", "-T", "-k", "-h", "0.0.0.0", "-P", "10110"]
