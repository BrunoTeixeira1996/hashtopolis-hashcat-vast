FROM nvidia/cuda:12.0.1-devel-ubuntu20.04

RUN apt-get update && apt-get install -y --no-install-recommends \
  zip \
  git \
  python3 \
  python3-psutil \
  python3-requests \
  pciutils \
  curl && \
  rm -rf /var/lib/apt/lists/*

CMD mkdir /root/htpclient

WORKDIR /root/htpclient

RUN git clone https://github.com/BrunoTeixeira1996/agent-python.git && \
  cd agent-python && \
  ./build.sh && \
  mv hashtopolis.zip ../ && \
  cd ../ && rm -R agent-python

CMD ["bash"]