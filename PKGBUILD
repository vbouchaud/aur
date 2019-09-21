# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/kubernetes-sigs/cri-tools/releases

pkgname=cri-tools-bin
pkgdesc="Container Runtime Interface Tools Binaries that interact with the container runtime through the container runtime interface"
pkgver=1.16.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('cri-tools' 'crictl' 'crictl-bin')
provides=('cri-tools')

sha256sums_x86_64=(
  'a3eefa10a483c643ad85aee3d7832a720976ef7e80dde46b212eaaacd7d09512'
)
sha256sums_armv7l=(
  '331c49bd9196009b8230f7a36ec272924a7bcf4c1614ecddf0eb9598c787da0e'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'aa118c31d6f6fd2d24bb2de4a33598a14a5952e1d01f93d5c3267c2b5334743b'
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
