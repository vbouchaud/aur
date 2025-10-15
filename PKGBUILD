pkgname=plakar
pkgver=1.0.5
pkgrel=1
pkgdesc="plakar is a backup solution"
source=("$pkgname-$pkgver.tar.gz::https://github.com/PlakarKorp/plakar/archive/v$pkgver.tar.gz")
url="https://plakar.io/"
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('ISC')
makedepends=('go')
sha256sums=('403062192081f65aaab598ec1837a6c52a0cf3ca22d4c77c658d83be5edb66b0')

_ensure_common_env() {
  export GOPATH="$srcdir/gopath"
  export CGO_CPPFLAGS="${CPPFLAGS}"
  export CGO_CFLAGS="${CFLAGS}"
  export CGO_CXXFLAGS="${CXXFLAGS}"
  export CGO_LDFLAGS="${LDFLAGS}"
  export CGO_ENABLED=1
}

prepare() {
  _ensure_common_env
  cd "$srcdir/$pkgname-$pkgver"

  go mod vendor \
    -modcacherw
}

check() {
  _ensure_common_env
  cd "$srcdir/$pkgname-$pkgver"

  go test \
    -mod=vendor \
    ./...
}

build() {
  _ensure_common_env
  cd "$srcdir/$pkgname-$pkgver"

  go build \
    -trimpath \
    -buildmode=pie \
    -mod=vendor \
    -ldflags "\
      -linkmode=external \
      -buildid=''
      -extldflags \"${LDFLAGS}\"" \
    -v .

}

package() {
  install -D -m0755 "$srcdir/$pkgname-$pkgver/plakar" "$pkgdir/usr/bin/plakar"
  for command in $(find "$srcdir/$pkgname-$pkgver" -name "*.1" -type f)
  do
    install -D -m0644 "$command" "$pkgdir/usr/share/man/man1/$(basename $command)"
  done
  for command in $(find "$srcdir/$pkgname-$pkgver" -name "*.7" -type f)
  do
    install -D -m0644 "$command" "$pkgdir/usr/share/man/man7/$(basename $command)"
  done
  install -D -m0644 "$srcdir/$pkgname-$pkgver/LICENSE" "$pkgdir/usr/share/licenses/plakar/LICENSE"
}
