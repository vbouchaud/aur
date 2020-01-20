# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/kubernetes-sigs/cri-tools/releases

pkgname=cri-tools-bin
pkgdesc="Container Runtime Interface Tools Binaries that interact with the container runtime through the container runtime interface"
pkgver=1.17.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('cri-tools' 'crictl' 'crictl-bin')
provides=('cri-tools')

sha256sums_x86_64=(
  '7b72073797f638f099ed19550d52e9b9067672523fc51b746e65d7aa0bafa414'
)
sha256sums_armv7l=(
  '9700957218e8e7bdc02cbc8fda4c189f5b6223a93ba89d876bdfd77b6117e9b7'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'd89afd89c2852509fafeaff6534d456272360fcee732a8d0cb89476377387e12'
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
