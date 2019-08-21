# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.15.2
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubectl')
provides=('kubectl')

sha256sums_x86_64=(
  '45bcc3f1dfa3ad9d6fe2c5d9e6509cfc38a5b65e40b7bf2924f6974853be421d'
)
sha256sums_armv7l=(
  '35d0ee3a8ff4ca61999b712dfb1569ea238442c2b4ebc233d0809fadcf5a6e2c'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '590728548106979631ff013af47054895222f1ab25674aed5a6e6c11460648d1'
)

source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_armhf_${sha256sums_armv7h}.deb"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)

package() {
  tar -vxf data.tar.xz

  install -D -m0755 "./usr/bin/kubectl" "${pkgdir}/usr/bin/kubectl"
}
