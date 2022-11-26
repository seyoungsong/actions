# docker run -it --rm ubuntu:xenial bash
FROM ubuntu:xenial

# apt
ARG DEBIAN_FRONTEND=noninteractive
RUN apt-get update -y && \
    apt-get upgrade -y && \
    apt-get install -y -qq --no-install-recommends \
    git pkg-config build-essential qt5-qmake \
    libvorbis-dev zlib1g-dev libhunspell-dev x11proto-record-dev \
    qtdeclarative5-dev libqtwebkit-dev libxtst-dev liblzo2-dev libbz2-dev \
    libao-dev libavutil-dev libavformat-dev libswresample-dev libtiff5-dev libeb16-dev \
    libqt5webkit5-dev libqt5svg5-dev libqt5x11extras5-dev qttools5-dev \
    qttools5-dev-tools qtmultimedia5-dev libqt5multimedia5-plugins libopencc-dev liblzma-dev libzstd1-dev doxygen cmake \
    # cleanup
    && \
    rm -rf /var/lib/apt/lists/*

# OpenCC
RUN git clone --depth=1 https://github.com/BYVoid/OpenCC \
    cd OpenCC/ && \
    make PREFIX=/usr -j$(nproc) && \
    make install && \
    cd .. && \
    qmake CONFIG+=release PREFIX=/usr CONFIG+=old_hunspell CONFIG+=zim_support # CONFIG+=chinese_conversion_support && \
    make -j$(nproc) && \
    make INSTALL_ROOT=appdir -j$(nproc) install ; find appdir/ && \
    wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage" && \
    chmod a+x linuxdeployqt-continuous-x86_64.AppImage && \
    unset QTDIR; unset QT_PLUGIN_PATH ; unset LD_LIBRARY_PATH && \
    # Add ssl libraries to .Appimage
    mkdir -p appdir/usr/lib/ && \
    cp /lib/x86_64-linux-gnu/libssl.so.1.0.0 appdir/usr/lib/ && \
    cp /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 appdir/usr/lib/ && \
    # linuxdeployqt uses this for naming the file
    export VERSION=$(git rev-parse --short HEAD) && \
    ./linuxdeployqt-continuous-x86_64.AppImage appdir/usr/share/applications/*.desktop -appimage