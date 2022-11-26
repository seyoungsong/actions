# docker run -it --rm ubuntu:xenial bash
FROM ubuntu:xenial

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    build-essential \
    cmake \
    doxygen \
    git \
    libao-dev \
    libavformat-dev \
    libavutil-dev \
    libbz2-dev \
    libeb16-dev \
    libhunspell-dev \
    liblzma-dev \
    liblzo2-dev \
    libopencc-dev \
    libqt5multimedia5-plugins \
    libqt5svg5-dev \
    libqt5webkit5-dev \
    libqt5x11extras5-dev \
    libqtwebkit-dev \
    libswresample-dev \
    libtiff5-dev \
    libvorbis-dev \
    libxtst-dev \
    libzstd1-dev \
    pkg-config \
    qt5-qmake \
    qtdeclarative5-dev \
    qtmultimedia5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    x11proto-record-dev \
    zlib1g-dev \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*
