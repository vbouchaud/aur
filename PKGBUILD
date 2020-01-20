# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/containernetworking/plugins/releases

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.8.4
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')
conflicts=('cni-plugins')
provides=('cni-plugins')

sha256sums_x86_64=(
  '09dc9242cb6cb87d0db5e06490f874fd63b91da3df14dae30d63b7a0cc0ebaff'
)
sha256sums_armv7l=(
  'badd3f768509ee9abafad9c019ff38f1c11d7897c00ea73aa941aea1d4ae0644'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '2440e9652709c767f1743b4af6aac265fff9ac1e56848005b331ea5fba6f8ec9'
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
