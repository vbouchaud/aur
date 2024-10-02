# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=bruno-bin
_pkgname=bruno
pkgdesc="Opensource API Client for Exploring and Testing APIs"
pkgver=1.32.0
pkgrel=1
arch=('x86_64')
url="https://www.usebruno.com/"
license=('MIT')
provides=('bruno')
conflicts=('bruno')
depends=(
    'c-ares'
    'gtk3'
    'libevent'
    'nss'
    'wayland'
    'alsa-lib'
)

# _latest function is used in a script that will auto update this PKGBUILD.
_latest() {
    curl -s https://api.github.com/repos/usebruno/bruno/releases | jq -r '.[0].tag_name'
}

source=(
    "https://github.com/usebruno/bruno/releases/download/v${pkgver}/bruno_${pkgver}_amd64_linux.deb"
    "LICENSE-$pkgver::https://raw.githubusercontent.com/usebruno/bruno/v${pkgver}/license.md"
)

package() {
    cd $pkgdir

    tar -vxf $srcdir/data.tar.xz

    mkdir -p usr/bin
    ln -sf /opt/Bruno/bruno usr/bin/bruno

    install -D -m0644 "$srcdir/LICENSE-$pkgver" "$pkgdir/usr/share/licenses/$_pkgname/LICENSE"
}

sha256sums=(
    22ce259749d492293e3ea5a3a6bb6283d8015c5148ddc4c27c6b2253694cf248
    8891070a847e5047bf77d38d88d7dfbab1beab41e37c802b9f5b23f2bbb9c7be
)
