# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://github.com/kubernetes-sigs/cri-tools/releases

pkgname=cri-tools-bin
pkgdesc="Container Runtime Interface Tools Binaries that interact with the container runtime through the container runtime interface"
pkgver=1.18.0
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
conflicts=('cri-tools' 'crictl' 'crictl-bin')
provides=('cri-tools')

sha256sums_x86_64=(
  '876dd2b3d0d1c2590371f940fb1bf1fbd5f15aebfbe456703ee465d959700f4a'
)
sha256sums_armv7l=(
  'd420925d10b47a234b7e51e9cf1039c3c09f2703945a99435549fcdd7487ae3a'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '95ba32c47ad690b1e3e24f60255273dd7d176e62b1a0b482e5b44a7c31639979'
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
