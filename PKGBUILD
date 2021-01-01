# Maintainer: Max Cohen
pkgname=dwm
pkgver=6.2
pkgrel=1
pkgdesc="A dynamic window manager for X - mrmojo's fork"
arch=('i686' 'x86_64')
url="https://github.com/maxjcohen/dwm"
license=('MIT')
groups=()
depends=('libxft' 'libxinerama')
makedepends=()
checkdepends=()
optdepends=()
provides=()
conflicts=()
replaces=()
backup=()
options=()
install=
changelog=
source=()
noextract=()
md5sums=()
validpgpkeys=()

build() {
	cd $startdir
	make
}

package() {
	cd "$startdir"
	make PREFIX=/usr DESTDIR="$pkgdir/" install
	install -m644 -D LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
