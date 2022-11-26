# clone repo
git clone --depth=1 https://github.com/goldendict/goldendict
cd goldendict

# make
qmake CONFIG+=release PREFIX=/usr CONFIG+=old_hunspell CONFIG+=zim_support
make -j$(nproc)
make INSTALL_ROOT=appdir -j$(nproc) install

# AppImage

## unset env var
unset QTDIR
unset QT_PLUGIN_PATH
unset LD_LIBRARY_PATH

## Add ssl libraries to .AppImage
mkdir -p appdir/usr/lib/
cp /lib/x86_64-linux-gnu/libssl.so.1.0.0 appdir/usr/lib/
cp /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 appdir/usr/lib/

## linuxdeployqt uses this for naming the file
export VERSION=$(git rev-parse --short HEAD)

## create AppImage
linuxdeployqt-continuous-x86_64.AppImage appdir/usr/share/applications/*.desktop -appimage

## move artifacts to dir
mkdir -p /artifact
mv GoldenDict*.AppImage* /artifact
ls -hal /artifact
