# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.17.1
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet' 'kubectl' 'cri-tools' 'cni-plugins')
conflicts=('kubernetes' 'kubernetes-bin' 'kubeadm')
provides=('kubeadm')

sha256sums_x86_64=(
  'dc58ea341070ce8643ebd1267d33757eb08ecfb590ea81028cfdd6d722b5621c'
)
sha256sums_armv7l=(
  '2d84138e44e04955df9c12a73215edc167faf811561eb13601b69fcaf3d095d3'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '1744fe9f03c565b9acad436b3c644678fd6d1921da80f39a409e6635beaa6849'
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
