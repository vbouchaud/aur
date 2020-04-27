# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.18.1
pkgrel=2
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('iptables' 'cni-plugins' 'iproute2' 'socat' 'libutil-linux' 'ethtool' 'ebtables' 'arptables' 'conntrack-tools' 'ipset' 'ipvsadm')
optdepends=(
  'docker: use docker as kubernetes runtime'
  'containerd: industry-standard container runtime'
  'cri-o: open container initiative-based implementation of kubernetes container runtime interface'
  'frakti: hypervisor-based container runtime for kubernetes'
)
conflicts=('kubernetes' 'kubernetes-bin' 'kubelet')
provides=('kubelet')

sha256sums_x86_64=(
  'cf8f66fa6c573e290943c45a4552796426219d8611654c0c7ba711c862a6c7a8'
)
sha256sums_armv7l=(
  '6b7ca88b5de10e4c4f19a39693892b1a8b8b61c462da836850d8b170461ead79'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'dc48a3c2e41838b4cbc4c5763bd3bec72d386ad551cf9064f9fc43c4ca9d12e8'
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
