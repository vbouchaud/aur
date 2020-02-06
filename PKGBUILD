# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/containernetworking/plugins/releases

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.5
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')
conflicts=('cni-plugins')
provides=('cni-plugins')

sha256sums_x86_64=(
  'bd682ffcf701e8f83283cdff7281aad0c83b02a56084d6e601216210732833f9'
)
sha256sums_armv7l=(
  '86a868234045837cb3f5d58a0a4468ff42845d50b5e87bd128f050ef393d7495'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'a7881ec37e592c897bdfd2a225b4ed74caa981e3c4cdcf8f45574f8d2f111bce'
)

source_x86_64=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-amd64-v${pkgver}.tgz"
)
source_armv7l=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-linux-arm-v${pkgver}.tgz"
)
source_armv7h=(
  "${source_armv7l}"
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
