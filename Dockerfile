FROM ubuntu:latest

WORKDIR /

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential ca-certificates pkg-config \
    git libusb-1.0-0 libusb-1.0-0-dev librtlsdr0 librtlsdr-dev

RUN git clone https://github.com/mik3y/rtl-ais.git
RUN cd rtl-ais && make && chmod 755 rtl_ais

EXPOSE 10110/tcp
ENTRYPOINT ["/rtl-ais/rtl_ais", "-T", "-k", "-h", "0.0.0.0", "-P", "10110"]
