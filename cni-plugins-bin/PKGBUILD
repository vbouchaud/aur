# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/containernetworking/plugins/releases

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.7
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')
conflicts=('cni-plugins')
provides=('cni-plugins')

sha256sums_x86_64=(
  '977824932d5667c7a37aa6a3cbba40100a6873e7bd97e83e8be837e3e7afd0a8'
)
sha256sums_armv7l=(
  '5757778f4c322ffd93d7586c60037b81a2eb79271af6f4edf9ff62b4f7868ed9'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'ae13d7b5c05bd180ea9b5b68f44bdaa7bfb41034a2ef1d68fd8e1259797d642f'
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
