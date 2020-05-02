# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.18.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubectl')
provides=('kubectl')

sha256sums_x86_64=(
  '89df64c5d736fa79e5a9754d94541b02c29f52d6d5720dbb3d58e22406a969f5'
)
sha256sums_armv7l=(
  'aacce1f3246296eaeb87eba47dfebf5e881a6f8b1119a1cdc890ffdaea2a5d64'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '9d85cf288db2c8abc93c4b41ce6eaee2f157c13413b80be45954c41b2b762641'
)

source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "${source_armv7l}"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubectl_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)

package() {
  tar -vxf data.tar.xz

  install -D -m0755 "${srcdir}/usr/bin/kubectl" "${pkgdir}/usr/bin/kubectl"

  "${pkgdir}/usr/bin/kubectl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubectl"
  "${pkgdir}/usr/bin/kubectl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubectl"
}
