# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/containernetworking/plugins/releases

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')
conflicts=('cni-plugins')
provides=('cni-plugins')

sha256sums_x86_64=(
  '29a092bef9cb6f26c8d5340f3d56567b62c7ebdb1321245d94b1842c80ba20ba'
)
sha256sums_armv7l=(
  '6094887394e0f10cfb538a0a052bc94a89a88b77af2e438b66e2c0bee26b52ee'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'aa931e78f08f00edd01f8b5ea2c9402cbf3877d91f9fbe9c132c05430cc7a493'
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
