FROM nvcr.io/nvidia/cuda:11.2.0-devel-ubuntu20.04

ENV PATH /usr/local/bin:$PATH

# build python 3.9.1
RUN apt-get update && apt-get install -y --no-install-recommends \
  build-essential zlib1g-dev libncurses5-dev libgdbm-dev libnss3-dev \
  libssl-dev libreadline-dev libffi-dev libsqlite3-dev wget libbz2-dev

WORKDIR /tmp
RUN wget https://www.python.org/ftp/python/3.9.1/Python-3.9.1.tgz \
  && tar -xf Python-3.9.1.tgz \
  && cd Python-3.9.1 \
  && sh ./configure --enable-optimizations --prefix /usr/local \
  && make -j 12 \
  && make install

WORKDIR /home

