# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.14.2
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubectl')
provides=('kubectl')

sha256sums_x86_64=(
  '98c512ffae2ab4b42b86ba3ae51c9a3621828867c395f6729931d977b5c51ddb'
)
sha256sums_armv7l=(
  '23503bf84c14a0cb64d1762e71b8a58d092ef95b0b8d79e3483224a625aa617a'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'bd549aa48cee78e573ab0426ddc14dd8cc6758e14cc3d0873ccfbbf606ec9ac8'
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
