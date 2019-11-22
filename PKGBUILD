# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/kubernetes-sigs/cri-tools/releases

pkgname=cri-tools-bin
pkgdesc="Container Runtime Interface Tools Binaries that interact with the container runtime through the container runtime interface"
pkgver=1.16.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('cri-tools' 'crictl' 'crictl-bin')
provides=('cri-tools')

sha256sums_x86_64=(
  '19fed421710fccfe58f5573383bb137c19438a9056355556f1a15da8d23b3ad1'
)
sha256sums_armv7l=(
  '367826f3eb06c4d923f3174d23141ddacef9ffcb0c902502bd922dbad86d08dd'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '62b60ab7046b788df892a1b746bd602c520a59c38232febc0580692c9805f641'
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
