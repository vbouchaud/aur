# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.16.0
pkgrel=3
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('iptables' 'cni-plugins' 'iproute2' 'socat' 'libutil-linux' 'ethtool' 'ebtables' 'arptables' 'conntrack-tools' 'ipset' 'ipvsadm')
conflicts=('kubernetes' 'kubernetes-bin' 'kubelet')
provides=('kubelet')

sha256sums_x86_64=(
  'e919939f5dad4bc7b0047fe2cf2870ab1946e87f948ab7f75bc1d63305436664'
)
sha256sums_armv7l=(
  'de662c40e14620bec725d37339bc254d640cd97b2753e2c015fbc27cb76dcd13'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '2edc82d3f49f54516e7b0f197ef1d22539867d738412add20b697594e79eb651'
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
