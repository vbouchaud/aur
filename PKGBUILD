# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.15.0
pkgrel=0
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet-bin')
conflicts=('kubernetes' 'kubernetes-bin')
provides=('kubeadm')
sha256sums_x86_64=(
  'e016ea058d1cb8bc82b0d6795eb65f1fa5a637d9706b5c8967a7f8e71927c86d'
)
sha256sums_armv7l=(
  'b8c05da6659f7f43813685814e2e88ffb0d0723c8702f92c3c850be0631186fe'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  'd30f192b3549fb43427be1c2b8c3104ca96ca786cd124f1d73c9cb88fadbd05c'
)
source_x86_64=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_amd64_${sha256sums_x86_64}.deb"
)
source_armv7l=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_armhf_${sha256sums_armv7l}.deb"
)
source_armv7h=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_armhf_${sha256sums_armv7h}.deb"
)
source_aarch64=(
  "https://packages.cloud.google.com/apt/pool/kubeadm_${pkgver}-00_arm64_${sha256sums_aarch64}.deb"
)
package() {
  tar -vxf data.tar.xz
  install -D -m0644 "./etc/systemd/system/kubelet.service.d/10-kubeadm.conf" "${pkgdir}/etc/systemd/system/kubelet.service.d/10-kubeadm.conf"
  install -D -m0755 "./usr/bin/kubeadm" "${pkgdir}/usr/bin/kubeadm"
}
