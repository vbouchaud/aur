# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.0
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')

sha256sums_x86_64=(
  'b579afff0af402d406d2af6664eb4a53a1040078edab297e9b306084ddd320af'
)
sha256sums_armv7l=(
  '68a3c590fa8af1003db2bcda0b4a8f53c6c14a7b1ab8e2c32e9c83a24534d21e'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'a9abd57bdc7e3694f44b75a1f997f9117667338449e9f13173337b3f9762a9bd'
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

