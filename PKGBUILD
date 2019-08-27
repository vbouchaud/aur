# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.15.3
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubectl')
provides=('kubectl')

sha256sums_x86_64=(
  'f798287e734bbf94e438651311c4ca16866559871c1dfb34a33628257249cf7a'
)
sha256sums_armv7l=(
  'a1d3252914e6c8143a59d8545315cc99a015435adcf12a0d602aa9ef0cfe3103'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '6d008a24ece5b57efbef028172792801bec82f58cd4999645929c34b2cab995b'
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
