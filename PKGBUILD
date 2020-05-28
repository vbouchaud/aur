# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=(
    'iptables'
    'cni-plugins'
    'iproute2'
    'socat'
    'libutil-linux'
    'ethtool'
    'ebtables'
    'arptables'
    'conntrack-tools'
    'ipset'
    'ipvsadm'
)
optdepends=(
  'docker: use docker as kubernetes runtime'
  'containerd: industry-standard container runtime'
  'cri-o: open container initiative-based implementation of kubernetes container runtime interface'
  'frakti: hypervisor-based container runtime for kubernetes'
)
conflicts=('kubernetes' 'kubernetes-bin' 'kubelet')
provides=('kubelet')

sha256sums_x86_64=(
  'fb432bb5f4ff7c42123ba2d8f961b57378d8e1f9d571e1ee05d9b92f3bb0114a'
)
sha256sums_armv7l=(
  'cd547537e47446f1b84c052394206b3607565ed33012f3c034bb05ab3adef5ed'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '0a8fefabe525a6e38abb2d98fe6cf3dcb2ab8dcc2d432fa8f7388012ee852fef'
)

source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "${source_armv7l}"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubelet_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)

package() {
  tar -vxf data.tar.xz

  install -D -m0644 "${srcdir}/lib/systemd/system/kubelet.service" "${pkgdir}/usr/lib/systemd/system/kubelet.service"
  install -D -m0755 "${srcdir}/usr/bin/kubelet" "${pkgdir}/usr/bin/kubelet"
}
