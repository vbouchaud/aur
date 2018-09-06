# Maintainer: Giacomo Longo <gabibbo97@gmail.com>
pkgname=kubebuilder
pkgver=1.0.3
pkgrel=3
pkgdesc="SDK for building Kubernetes APIs"
url="https://github.com/kubernetes-sigs/kubebuilder"
license=('APACHE')
source=("https://github.com/kubernetes-sigs/kubebuilder/releases/download/v${pkgver}/kubebuilder_${pkgver}_linux_amd64.tar.gz")
md5sums=('0605015b141a568c23d29088881f664b')
arch=('x86_64')

package() {
  mkdir -p "$pkgdir/usr/local/kubebuilder"
  rsync -av "$srcdir/kubebuilder_${pkgver}_linux_amd64/" "$pkgdir/usr/local/kubebuilder/"
}
