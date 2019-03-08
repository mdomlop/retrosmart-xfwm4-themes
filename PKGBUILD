# Maintainer: Manuel Domínguez López <mdomlop at gmail dot com>

_pkgver_year=2018
_pkgver_month=01
_pkgver_day=09

pkgname=retrosmart-xfwm4-themes
pkgver=1.0
pkgrel=1
pkgdesc="Retrosmart themes for XFwm4"
url="https://github.com/mdomlop/$pkgname"
source=()
license=('GPL3')
changelog=ChangeLog
optdepends=('xcursors-retrosmart: The corresponding X11 cursor theme')
arch=('any')
group=('retrosmart')

build() {
    cd "$startdir"
    make
    }

package() {
    cd "$startdir"
    make install DESTDIR=${pkgdir} PREFIX='/usr'
}
