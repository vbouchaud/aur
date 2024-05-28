# Maintainer: Ben Leynen <leynenben@gmail.com>
OPTIONS=(!debug)
pkgname=grafana-alloy-bin
_binaryname=alloy
pkgver=v1.1.0
pkgrel=1
pkgdesc="A vendor-neutral distribution of the OpenTelemetry (OTel) Collector."
arch=('x86_64')
_binaryarch=('linux-amd64')
url="https://github.com/grafana/alloy"
license=('Apache-2.0')
makedepends=('unzip' 'bc')
source=("$pkgname-$pkgver.zip::${url}/releases/download/${pkgver}/${_binaryname}-${_binaryarch}.zip")
sha256sums=('0e5f8ed6d3e57fadbdb3e65b8556a5fe261b673e834da92abab75da3d03a3c69')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/${_binaryname}-${_binaryarch}" "${pkgdir}/usr/bin/${_binaryname}"
}
