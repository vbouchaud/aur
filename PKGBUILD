# Maintainer: Vianney Bouchaud <aur dot v at bouchaud dot org>

pkgname=cni-plugins-bin
pkgdesc="Container Network Interface - networking for Linux containers"
pkgver=0.7.5
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://github.com/containernetworking/plugins"
license=('apache')

sha256sums_x86_64=(
  '3ca15c0a18ee830520cf3a95408be826cbd255a1535a38e0be9608b25ad8bf64'
)

sha256sums_armv7l=(
  '0eb4a528b5b2e4ce23ebc96e41b2f5280d5a64d41eec8dd8b16c3d66aaa0f6b8'
)

sha256sums_armv7h=(
  '0eb4a528b5b2e4ce23ebc96e41b2f5280d5a64d41eec8dd8b16c3d66aaa0f6b8'
)

sha256sums_aarch64=(
  '7fec91af78e9548df306f0ec43bea527c8c10cc3a9682c33e971c8522a7fcded'
)

source_x86_64=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-amd64-v${pkgver}.tgz"
)

source_armv7l=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-arm-v${pkgver}.tgz"
)

source_armv7h=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-arm-v${pkgver}.tgz"
)

source_aarch64=(
  "https://github.com/containernetworking/plugins/releases/download/v${pkgver}/cni-plugins-arm64-v${pkgver}.tgz"
)

package() {
  cd "$srcdir"
  mkdir -p "$pkgdir"/opt/cni/bin
  install -Dm755 * "$pkgdir"/opt/cni/bin
  rm "$pkgdir"/opt/cni/bin/cni-plugins-amd64-v${pkgver}.tgz
}

