# Maintainer: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Joshua Wong <joshuawong AT anticentri DOT st>
# Contributor: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=vcluster
pkgdesc='Create fully functional virtual Kubernetes clusters'
pkgver=0.16.3
pkgrel=1
arch=('x86_64' 'armv7l' 'armv7h' 'aarch64')
url="https://vcluster.com"
license=('apache')
makedepends=(
    'go'
)
depends=(
    'glibc'
)

_latest() {
    curl -s https://api.github.com/repos/loft-sh/vcluster/releases | jq -r '.[0].tag_name'
}

source=(
    "${pkgname}-${pkgver}.tar.gz::https://github.com/loft-sh/vcluster/archive/refs/tags/v${pkgver}.tar.gz"
)

sha256sums=(
    '9c335af10d7daf9ab66d7b7c201576c687b6a2c347c2f2ce71096877c3250dc6'
)

prepare() {
    cd "$pkgname-$pkgver"
    mkdir -p build/
}

build() {
    cd "$pkgname-$pkgver"
    export GOPATH="$srcdir/gopath"
    export CGO_CPPFLAGS="${CPPFLAGS}"
    export CGO_CFLAGS="${CFLAGS}"
    export CGO_CXXFLAGS="${CXXFLAGS}"

    go build \
       -trimpath \
       -buildmode=pie \
       -mod=readonly \
       -modcacherw \
       -ldflags "\
        -linkmode=external \
        -buildid='' \
        -extldflags=\"${LDFLAGS}\"" \
       -o build/$pkgname ./cmd/vclusterctl/main.go
}

check() {
    cd "$pkgname-$pkgver"
    go test ./cmd/vclusterctl/...
}

package() {
    cd "$pkgname-$pkgver"

    install -Dm755 build/"$pkgname" "$pkgdir/usr/bin/$pkgname"

    build/"$pkgname" completion bash | install -Dm644 /dev/stdin "$pkgdir/usr/share/bash-completion/completions/$pkgname"
    build/"$pkgname" completion zsh | install -Dm644 /dev/stdin "$pkgdir/usr/share/zsh/site-functions/_$pkgname"
}
