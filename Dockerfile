FROM ubuntu:latest

WORKDIR /

RUN apt-get update && \
  apt-get install -y --no-install-recommends \
    build-essential \
    ca-certificates \
    pkg-config \
    automake \
    autotools-dev \
    autoconf \
    libtool \
    git \
    libusb-1.0-0 \
    libusb-1.0-0-dev

# The ubuntu `librtlsdr0` package is a little out of date; build from
# the "steve-m" fork.
RUN git clone https://github.com/steve-m/librtlsdr
RUN cd librtlsdr && \
  autoreconf -i && \
  ./configure --prefix=/usr && \
  make && \ 
  make install

RUN git clone https://github.com/mik3y/rtl-ais.git
RUN cd rtl-ais && \
  make && \
  chmod 755 rtl_ais && \
  cp rtl_ais /usr/local/bin/

EXPOSE 10110/tcp
ENTRYPOINT ["/usr/local/bin/rtl_ais", "-T", "-k", "-h", "0.0.0.0", "-P", "10110"]
