# docker run -it --rm ubuntu:xenial bash
# docker run -it --rm --privileged -e DISPLAY=host.docker.internal:0 seyoungsong/goldendict bash
FROM ubuntu:xenial

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    build-essential \
    ca-certificates \
    cmake \
    doxygen \
    file \
    fuse \
    git \
    libao-dev \
    libavformat-dev \
    libavutil-dev \
    libbz2-dev \
    libeb16-dev \
    libfuse2 \
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
    qt5-default \
    qt5-qmake \
    qtdeclarative5-dev \
    qtmultimedia5-dev \
    qttools5-dev \
    qttools5-dev-tools \
    wget \
    x11proto-record-dev \
    zlib1g-dev \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# linuxdeployqt-continuous-x86_64.AppImage
RUN wget "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage" && \
    chmod a+x linuxdeployqt-continuous-x86_64.AppImage && \
    mv linuxdeployqt-continuous-x86_64.AppImage /usr/local/bin
