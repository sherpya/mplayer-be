#!/bin/sh

rm -fr dist
mkdir -p dist
version=$(cd frei0r && git describe --tags)

archive=$(cd dist && pwd)/frei0r-plugins-x86-${version}.7z
( cd /usr/i686-w64-mingw32/lib && 7z a -mx=9 ${archive} frei0r-1 )

archive=$(cd dist && pwd)/frei0r-plugins-x86_64-${version}.7z
( cd /usr/x86_64-w64-mingw32/lib && 7z a -mx=9 ${archive} frei0r-1 )
