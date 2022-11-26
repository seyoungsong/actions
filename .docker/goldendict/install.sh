# git clone
git clone --depth=1 https://github.com/goldendict/goldendict
# build
qmake CONFIG+=release PREFIX=/usr CONFIG+=old_hunspell CONFIG+=zim_support
make -j$(nproc)
# prepare AppImage
make INSTALL_ROOT=appdir -j$(nproc) install
find appdir/
wget -c -nv "https://github.com/probonopd/linuxdeployqt/releases/download/continuous/linuxdeployqt-continuous-x86_64.AppImage"
chmod a+x linuxdeployqt-continuous-x86_64.AppImage
unset QTDIR
unset QT_PLUGIN_PATH
unset LD_LIBRARY_PATH
# Add ssl libraries to .Appimage
mkdir -p appdir/usr/lib/
cp /lib/x86_64-linux-gnu/libssl.so.1.0.0 appdir/usr/lib/
cp /lib/x86_64-linux-gnu/libcrypto.so.1.0.0 appdir/usr/lib/
# linuxdeployqt uses this for naming the file
export VERSION=$(git rev-parse --short HEAD)
./linuxdeployqt-continuous-x86_64.AppImage appdir/usr/share/applications/*.desktop -appimage

# after_success
# find appdir -executable -type f -exec ldd {} \; | grep " => /usr" | cut -d " " -f 2-3 | sort | uniq
