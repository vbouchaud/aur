# Maintainer: Ben Leynen <leynenben@gmail.com>
OPTIONS=(!debug)
pkgname=grafana-alloy-bin
_binaryname=alloy
pkgver=v1.0.0
pkgrel=2
pkgdesc="A vendor-neutral distribution of the OpenTelemetry (OTel) Collector."
arch=('x86_64')
_binaryarch=('linux-amd64')
url="https://github.com/grafana/alloy"
license=('Apache-2.0')
makedepends=('unzip' 'bc')
source=("$pkgname-$pkgver.zip::${url}/releases/download/${pkgver}/${_binaryname}-${_binaryarch}.zip")
sha256sums=('c926b29ed75d37b1bb2945a70f8f3e580b9f6192467ff956e3bbf52b70ad7321')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/${_binaryname}-${_binaryarch}" "${pkgdir}/usr/bin/${_binaryname}"
}
