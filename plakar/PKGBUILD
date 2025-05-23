pkgname=plakar
pkgver=1.0.1
pkgrel=1
pkgdesc="plakar is a backup solution"
url="https://github.com/PlakarKorp/plakar"
source=("$pkgname-$pkgver.tar.gz::https://github.com/PlakarKorp/plakar/archive/v$pkgver.tar.gz")
arch=('i686' 'pentium4' 'x86_64' 'arm' 'armv7h' 'armv6h' 'aarch64')
license=('ISC')
makedepends=('go')
sha256sums=('3d1cc92fbae24ec1debd5d19f1aeb5443ca1537fe4c762ca529c9f9f1e744c78')

build () {
  cd "$srcdir/$pkgname-$pkgver"
  go build -v . 
}

package() {
  cd "$srcdir/$pkgname-$pkgver"
  
  install -Dm755 plakar "${pkgdir}/usr/bin/plakar"
  for command in $(find . -name "*.1")
  do
	  install -Dm644 "$command" "$pkgdir/usr/share/man/man1/$(basename $command)"
  done

  install -Dm644 LICENSE "${pkgdir}/usr/share/licenses/${pkgname}/LICENSE"
}
