# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# Contributor: Daniel Milde <daniel at milde dot cz>

pkgname=gore
pkgdesc="Yet another Go REPL that works nicely"
pkgver=0.6.0
pkgrel=1
arch=('x86_64')
_gopkg="github.com/x-motemen/gore"
url="https://${_gopkg}"
license=('MIT')
depends=(
  'go'
)

source=(
  "${pkgname}-${pkgver}.tar.gz::${url}/archive/v${pkgver}.tar.gz"
)

sha256sums=(
  'bb145d967605fb42a8f0db3c8a6b4cfd1e2d7ff083423dd816474889e5eea46d'
)

prepare(){
  cd $pkgname-$pkgver
  mkdir -p build/
}

build() {
    cd $pkgname-$pkgver
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
      -trimpath \
      -buildmode=pie \
      -mod=readonly \
      -modcacherw \
      -ldflags "
        -linkmode=external
        -buildid=''
        -extldflags '${LDFLAGS}'
        -X '${_gopkg}/cli.revision=${pkgver}'
      " \
      -o build ./cmd/gore
}

package() {
  cd "$pkgname-$pkgver"

  install -D -m0755 build/gore "${pkgdir}/usr/bin/gore"
  install -D -m0644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}

# vim:set ts=2 sw=2 et:
