#!/bin/sh

set -ex

apt-get update

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

git clone https://github.com/steve-m/librtlsdr
cd librtlsdr && \
  autoreconf -i && \
  ./configure --prefix=/usr && \
  make &&\
  make install

git clone https://github.com/mik3y/rtl-ais.git
cd rtl-ais && \
  make && \
  chmod 755 rtl_ais && \
  cp rtl_ais /usr/local/bin/

rm -rf librtlsdr rtl-ais

apt-get remove -y \
    build-essential \
    ca-certificates \
    pkg-config \
    automake \
    autotools-dev \
    autoconf \
    libtool \
    git \
    libusb-1.0-0-dev

apt-get autoremove -y

rm -rf /tmp/* /var/lib/apt/lists/*
