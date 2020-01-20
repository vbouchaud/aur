# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubelet-bin
pkgdesc="Kubernetes.io kubelet binary"
pkgver=1.17.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('iptables' 'cni-plugins' 'iproute2' 'socat' 'libutil-linux' 'ethtool' 'ebtables' 'arptables' 'conntrack-tools' 'ipset' 'ipvsadm')
conflicts=('kubernetes' 'kubernetes-bin' 'kubelet')
provides=('kubelet')

sha256sums_x86_64=(
  'c9133d2dedcc6364fe525cd8ea15a3024b7bf866f5465121d561032006e20be6'
)
sha256sums_armv7l=(
  '0842dd1ddf1df95469f292b8c7d51909948c2b3aa664024eccc8fca4e421b0e0'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '5df2c0d532fa791ad12c85822f398726ceecb273778993bbb6ef301ba6f4f16a'
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
