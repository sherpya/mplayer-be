#!/bin/bash

. $(dirname $0)/../config.sh

owner="$(id -u):$(id -g)"

sudo mkdir -p ${PREFIX}/bin

for dir in bin lib include; do
    sudo chown $owner ${PREFIX}/$dir
done

PKGCONFIG="${PREFIX}/bin/${HOST}-pkg-config"

cat > ${PKGCONFIG} << EOF
#!/bin/bash
export PKG_CONFIG_LIBDIR=/usr/${HOST}/lib/pkgconfig
exec pkg-config \$*
EOF

chmod 755 ${PKGCONFIG}
