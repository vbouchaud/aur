# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/kubernetes-sigs/cri-tools/releases

pkgname=cri-tools-bin
pkgdesc="Container Runtime Interface Tools Binaries that interact with the container runtime through the container runtime interface"
pkgver=1.19.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('cri-tools' 'crictl' 'crictl-bin')
provides=('cri-tools')

sha256sums_x86_64=(
  '87d8ef70b61f2fe3d8b4a48f6f712fd798c6e293ed3723c1e4bbb5052098f0ae'
)
sha256sums_armv7l=(
  'b72fd3c4b35f60f5db2cfcd8e932f6000cf9c2978b54adfcf60ee5e2d452e92f'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'ec040d14ca03e8e4e504a85dae5353e04b5d9d8aea3df68699258992c0eb8d88'
)

source_x86_64=(
  "https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-amd64.tar.gz"
)
source_armv7l=(
  "https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-arm.tar.gz"
)
source_armv7h=(
  "${source_armv7l}"
)
source_aarch64=(
  "https://github.com/kubernetes-sigs/cri-tools/releases/download/v${pkgver}/crictl-v${pkgver}-linux-arm64.tar.gz"
)

package() {
  install -D -m0755 "${srcdir}/crictl" "${pkgdir}/usr/bin/crictl"

  "${pkgdir}/usr/bin/crictl" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/crictl"
  "${pkgdir}/usr/bin/crictl" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_crictl"
}
