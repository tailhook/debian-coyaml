# Maintainer: Paul Colomiets <pc@gafol.net>

pkgname=coyaml
pkgver=${VERSION}
pkgrel=1
pkgdesc="A configuration file parser generator"
arch=('i686' 'x86_64')
url="http://github.com/tailhook/coyaml"
license=('MIT')
depends=('libyaml')
makedepends=('python' 'python-yaml')
source=(https://github.com/downloads/tailhook/coyaml/$pkgname-$pkgver.tar.bz2)
md5sums=('${DIST_MD5}')

build() {
  cd $srcdir/$pkgname-$pkgver
  ./waf configure --prefix=/usr
  ./waf build
}

check() {
  cd $srcdir/$pkgname-$pkgver
  ./waf test
}

package() {
  cd $srcdir/$pkgname-$pkgver
  ./waf install --destdir=$pkgdir
  install -D -m644 LICENSE "$pkgdir/usr/share/licenses/$pkgname/LICENSE"
}
