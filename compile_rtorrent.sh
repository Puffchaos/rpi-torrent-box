#!/bin/bash
set -e

pwd

# PREPARE NEEDED LIBS

echo - Installing curl
cd curl-$CURL_VERSION && make install V=0
cd ..
pwd

echo - Installing xmlrpc
cd xmlrpc-c && make install V=0
cd ..
pwd

echo - Installing libtorrent
cd libtorrent-$VER_LIBTORRENT && make install V=0
cd ..
pwd

# COMPILE RTORRENT

cd rtorrent-$VER_RTORRENT
./autogen.sh
echo - Configure libtorrent
./configure --quiet --enable-silent-rules --with-xmlrpc-c --with-ncurses
echo - Begin compile libtorrent
make -j -l2 V=0
echo - Finish compile libtorrent
make install V=0
ls -la /usr/local/lib
ls -la /usr/local/bin
ldconfig
