# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.17.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('iptables' 'cni-plugins' 'iproute2' 'socat' 'libutil-linux' 'ethtool' 'ebtables' 'arptables' 'conntrack-tools' 'ipset' 'ipvsadm')
conflicts=('kubernetes' 'kubernetes-bin' 'kubelet')
provides=('kubelet')

sha256sums_x86_64=(
  'f0b930ce4160af585fb10dc8e4f76747a60f04b6343c45405afbe79d380ae41f'
)
sha256sums_armv7l=(
  '823a90734737fe21cebebeb941e610f90aebabdc2c25bc54a5f17451a2e1e369'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'e52b893b767231f0baaa064aabf5e005207a5dc44fce0d2ea160b9f7480d48e3'
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
