# Maintainer: David Runge <dvzrv@archlinux.org>

pkgbase=cri-tools
pkgname=(
  crictl
  critest
)
pkgver=1.27.1
pkgrel=1
pkgdesc="CLI and validation tools for Kubelet Container Runtime Interface (CRI)"
arch=(x86_64)
url="https://github.com/kubernetes-sigs/cri-tools"
license=(Apache)
groups=(kubernetes-tools)
depends=(glibc)
makedepends=(go)
source=(https://github.com/kubernetes-sigs/cri-tools/archive/v$pkgver/$pkgbase-v$pkgver.tar.gz)
sha512sums=('7e4349fa9a0a16d27fbde363a26978fe6e65a326d29b344f13cd2b43009f12f8cdf14fd9557ac29beb913d4258160e0fa4108d40378dd1216ff631922e40392e')
b2sums=('b0d5dc7ba6ca4d878e00ac181dfd3f2ee7b7c70bddfa8311e3f4e9d6cb1853b148d053704b1275e8a2511da60361c6db8a5b25191b6eca9e693ae74a1200d3a2')

build() {
  local common_ldflags=(
    -compressdwarf=false
    -linkmode external
  )

  export CGO_CPPFLAGS="$CPPFLAGS"
  export CGO_CFLAGS="$CFLAGS"
  export CGO_CXXFLAGS="$CXXFLAGS"
  export CGO_LDFLAGS="$LDFLAGS"
  export CGO_ENABLED=1
  export GOPATH="${srcdir}"
  export GOFLAGS="-buildmode=pie -mod=readonly -modcacherw"

  make VERSION=$pkgver GO_LDFLAGS="${common_ldflags[*]}" -C $pkgbase-$pkgver

  mkdir -vp completions
  $pkgbase-$pkgver/build/bin/linux/amd64/crictl completion bash > completions/crictl
  $pkgbase-$pkgver/build/bin/linux/amd64/crictl completion zsh > completions/_crictl
  $pkgbase-$pkgver/build/bin/linux/amd64/crictl completion fish > completions/crictl.fish
}

package_crictl() {
  pkgdesc="A CLI for CRI-compatible container runtimes"

  install -vDm 755 $pkgbase-$pkgver/build/bin/linux/amd64/$pkgname -t "$pkgdir/usr/bin/"
  # shell completion
  install -vDm 644 completions/$pkgname -t "$pkgdir/usr/share/bash-completion/completions/"
  install -vDm 644 completions/_$pkgname -t "$pkgdir/usr/share/zsh/site-functions/"
  install -vDm 644 completions/$pkgname.fish -t "$pkgdir/usr/share/fish/completions/"
  # docs
  install -vDm 644 $pkgbase-$pkgver/docs/$pkgname.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgbase-$pkgver/docs/examples/*.{json,yaml} -t "$pkgdir/usr/share/doc/$pkgname/examples/"
  install -vDm 644 $pkgbase-$pkgver/{{CHANGELOG,CONTRIBUTING,README,code-of-conduct}.md,SECURITY_CONTACTS} -t "$pkgdir/usr/share/doc/$pkgname"
}

package_critest() {
  pkgdesc="A benchmarking CLI for CRI-compatible container runtimes"

  install -vDm 755 $pkgbase-$pkgver/build/bin/linux/amd64/$pkgname -t "$pkgdir/usr/bin/"
  # docs
  install -vDm 644 $pkgbase-$pkgver/docs/{benchmark,validation}.md -t "$pkgdir/usr/share/doc/$pkgname/"
  install -vDm 644 $pkgbase-$pkgver/{{CHANGELOG,CONTRIBUTING,README,code-of-conduct}.md,SECURITY_CONTACTS} -t "$pkgdir/usr/share/doc/$pkgname/"
}
