EAPI=8

inherit xdg-utils

DESCRIPTION="Compare, merge files and folders using simple, powerful commands."
HOMEPAGE="https://www.scootersoftware.com"
SRC_URI="https://www.scootersoftware.com/files/${P}.x86_64.tar.gz"

LICENSE="Beyond_Compare_V5"
SLOT="0"
KEYWORDS="~amd64"
IUSE="caja kde konq nautilus nemo thunar"

DEPEND="dev-util/patchelf"

RDEPEND="
    dev-qt/qtcore:5
    dev-qt/qtgui:5
    dev-qt/qtprintsupport:5
    app-arch/bzip2
"

RESTRICT="strip"

pkg_postinst() {
    xdg_desktop_database_update
    xdg_mimeinfo_database_update
}

pkg_postrm() {
    xdg_desktop_database_update
    xdg_mimeinfo_database_update
}
