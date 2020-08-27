# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.4
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
  'b240a3c0686125ac16c2fc4fd333c135a69b7b2b167345f2d45c4707411f9068'
)
sha256sums_armv7l=(
  'e6603dd03e4fbc2e2bad184031f45a01b88184491c14ccae9cb15581771ee8c9'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '9673c718b54d485a92caf786ab6850fd393b7d6d3740dd9d1612a672336106a2'
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
