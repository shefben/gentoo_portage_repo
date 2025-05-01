# Copyright 2025
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit autotools git-r3

DESCRIPTION="XFCE panel plugin to toggle host aliases in /etc/hosts"
HOMEPAGE="https://github.com/Azmisov/xfce-hosts-plugin"
EGIT_REPO_URI="https://github.com/Azmisov/xfce-hosts-plugin.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"  # Add architecture keywords here, such as amd64 and x86
IUSE=""

RDEPEND="
    x11-libs/gtk+:3
    xfce-base/libxfce4util
    sys-auth/polkit
    xfce-base/libxfce4ui
"
DEPEND="${RDEPEND}
    sys-devel/gcc
    dev-build/make
    dev-util/intltool
    sys-devel/gettext
"

# This ensures git clones the repository into the correct directory
src_fetch() {
    git-r3_src_fetch
}

src_prepare() {
    default
    eautoreconf
}

src_configure() {
    ./autogen.sh
    default
}

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" install
    # Restart xfce4-panel after installation
    elog "To apply changes, restart xfce4-panel: xfce4-panel --restart"
}

pkg_postinst() {
    elog "The xfce-hosts-plugin has been installed. To use it, restart xfce4-panel."
    elog "You can add it to your XFCE panel via the 'Add New Items' menu."
}
