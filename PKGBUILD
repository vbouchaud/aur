# Maintainer: Ben Leynen <leynenben@gmail.com>

OPTIONS=(!debug)
pkgname=grafana-alloy-bin
binaryname=alloy
pkgver=v1.0.0
pkgrel=1
pkgdesc="Grafana Alloy is a vendor-neutral distribution of the OpenTelemetry (OTel) Collector."
arch=('x86_64')
binaryarch=('linux-amd64')
url="https://github.com/grafana/alloy"
license=('Apache-2.0')
makedepends=('unzip' 'bc')

source=("$pkgname-$pkgver.zip::${url}/releases/download/${pkgver}/${binaryname}-${binaryarch}.zip")
sha256sums=('c926b29ed75d37b1bb2945a70f8f3e580b9f6192467ff956e3bbf52b70ad7321')

package() {
	install -D -g root -m 0755 -o root "${srcdir}/${binaryname}-${binaryarch}" "${pkgdir}/usr/bin/${binaryname}"
}
