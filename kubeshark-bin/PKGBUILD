# Maintainer: Vianney Bouchaud <aur dot vianney at bouchaud dot org>

pkgname=kubeshark-bin
pkgdesc="Kubeshark is an API Traffic Analyzer for Kubernetes."
pkgver=41.1
pkgrel=2
arch=('x86_64' 'aarch64')
url="https://github.com/kubeshark/kubeshark"
license=('apache')
conflicts=('kubeshark')
provides=('kubeshark')

sha256sums_x86_64=(
    648f883d9e0a576a8303ff42b2a7c048de2ad2984226d1eb587ba63125b7b3e3
)
sha256sums_aarch64=(
    b8ff29b51e673f0df696579465c394f1bc5512c18a977777df334fa0076a28b1
)

source_x86_64=(
    "kubeshark::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_amd64"
)
source_aarch64=(
    "kubeshark::https://github.com/kubeshark/kubeshark/releases/download/${pkgver}/kubeshark_linux_arm64"
)

package() {
    install -D -m0755 "${srcdir}/kubeshark" "${pkgdir}/usr/bin/kubeshark"

    "${pkgdir}/usr/bin/kubeshark" completion bash | install -Dm644 /dev/stdin "${pkgdir}/usr/share/bash-completion/completions/kubeshark"
    "${pkgdir}/usr/bin/kubeshark" completion zsh | install -Dm644 /dev/stdin "${pkgdir}/usr/share/zsh/site-functions/_kubeshark"
}
