# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.6
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
  '104709951795724cd57228d458da3adc3746c77447132f2e1317666b321eebbb'
)
sha256sums_armv7l=(
  '9e60a4aba5bdb97b13b10ae4c4c84b5593b90766bdc092a604795deaa82968d9'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '42c883ec251913ccbd436b8bb732450b800ef154b9d6c6498c4c9886f8023c49'
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
