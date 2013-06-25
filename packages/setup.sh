#!/bin/bash

. $(dirname $0)/../config.sh

owner="$(id -u):$(id -g)"

sudo mkdir -p ${PREFIX}/bin ${PREFIX}/live

for dir in bin lib include live; do
    sudo chown $owner ${PREFIX}/$dir
done

sudo rm -f ${PREFIX}/lib/lib*pthread*

PKGCONFIG="${PREFIX}/bin/${HOST}-pkg-config"

cat > ${PKGCONFIG} << EOF
#!/bin/bash
export PKG_CONFIG_LIBDIR=/usr/${HOST}/lib/pkgconfig
exec pkg-config \$*
EOF

chmod 755 ${PKGCONFIG}
