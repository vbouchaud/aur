# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=(
    'iptables>=1:1.4.21'
    'cni-plugins>=0.7.5'
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
  '1fb09333a48950c243d165ba9b4989a99ad8130d135d8b18e72bcb151359d6fe'
)
sha256sums_armv7l=(
  '97667f9ee567c11f420b20350098a37dbcb28ae22a0898ddeec8288a6d9ee6de'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'dc9346b9c609b3579a0e5c571c41e0abe1d732452cc0ae96c16a88dd5092f82f'
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
