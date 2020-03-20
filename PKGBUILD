# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.17.4
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet' 'kubectl' 'cri-tools' 'cni-plugins')
conflicts=('kubernetes' 'kubernetes-bin' 'kubeadm')
provides=('kubeadm')

sha256sums_x86_64=(
  '03b9e3d53bd5591d0207e282b223da590b4ad1cd03df776b3da8aefe44cbedf2'
)
sha256sums_armv7l=(
  '92bfcfa48441899ea6eb9186f0045eb6ec155966ba7d0ea8c231d12744c9f5f6'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '51b54e97d706bc5a6e1181613b51116514b30d27d16fcb7af0c4007105df88ac'
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
