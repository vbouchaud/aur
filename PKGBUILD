# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>
# https://packages.cloud.google.com/apt/dists/kubernetes-xenial/main/binary-amd64/Packages

pkgname=kubeadm-bin
pkgdesc="Kubernetes.io kubeadm binary"
pkgver=1.16.2
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="http://kubernetes.io"
license=('apache')
depends=('kubelet' 'kubectl' 'cri-tools' 'cni-plugins')
conflicts=('kubernetes' 'kubernetes-bin' 'kubeadm')
provides=('kubeadm')

sha256sums_x86_64=(
  '52c08f02d316c643d02cdef59e90caca2dffce9b7525eff98cd8e1ac21360bed'
)
sha256sums_armv7l=(
  '8a023d2de742e542e69948950ea55bc520d77c7ad8711516ddf99fc996f27769'
)
sha256sums_armv7h=(
  "${sha256sums_armv7l}"
)
sha256sums_aarch64=(
  '757ea75db96d256ab4a7274c339d790296a56015ec491d657329552ee0f1d1a4'
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
