# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.1
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')

sha256sums_x86_64=(
  'e9bfc78acd3ae71be77eb8f3e890cc9078a33cc3797703b8ff2fc3077a232252'
)
sha256sums_armv7l=(
  'acde854e3def3c776c532ae521c19d8784534918cc56449ff16945a2909bff6d'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'acde854e3def3c776c532ae521c19d8784534918cc56449ff16945a2909bff6d'
)

source_x86_64=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-amd64-v${pkgver}.tgz"
)
source_armv7l=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-arm-v${pkgver}.tgz"
)
source_armv7h=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-arm-v${pkgver}.tgz"
)
source_aarch64=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-arm64-v${pkgver}.tgz"
)

package() {
  cd "${srcdir}"
  mkdir -p "${pkgdir}/opt/cni/bin"
  install -Dm755 * "${pkgdir}/opt/cni/bin"
  find "${pkgdir}/opt/cni/bin/" -name "cni-plugins-linux-*.tgz" -delete
}

