# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.18.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=(
    'kubelet'
    'kubectl'
    'cri-tools'
    'cni-plugins'
)
conflicts=('kubernetes' 'kubernetes-bin' 'kubeadm')
provides=('kubeadm')

sha256sums_x86_64=(
    'c3b236a6863db8907043301ff25c6e2738e296991302c5d0b1f52bd2dda2dd58'
)
sha256sums_armv7l=(
    '02de96f4ba3a15e25aa5f55c0ecc2f1a74dcd59a17c94d546208e35aab2a87de'
)
sha256sums_armv7h=(
    "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
    '5bf5e52ed46926315361351cbedb65ef5d082bf123d0e12f8ca574492f29bf9e'
)

source_x86_64=(
    "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
    "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "${source_armv7l}"
)
source_aarch64=(
    "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)

package() {
  tar -vxf data.tar.xz

  install -D -m0644 "${srcdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "${srcdir}/usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"

  "${pkgdir}/usr/bin/kubeadm" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeadm"
  "${pkgdir}/usr/bin/kubeadm" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeadm"
}
