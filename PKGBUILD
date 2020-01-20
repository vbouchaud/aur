# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubectl-bin
pkgdesc="Kubernetes.io client binary"
pkgver=1.17.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('kubectl')
provides=('kubectl')

sha256sums_x86_64=(
  '0dc19318c9114db2931552bb8bf650a14227a9603cb73fe0917ac7868ec7fcf0'
)
sha256sums_armv7l=(
  'cd457ef681ab3b7341021921e10c545182360653f01bf0619a560d1dc76758dd'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '5f96af0e66a64ff40f65df58342aaa72263582f5d981ba8a63ebd2497fd9d9c1'
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
