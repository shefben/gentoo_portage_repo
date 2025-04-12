EAPI=8

inherit autotools git-r3

DESCRIPTION="Network graph plugin for Xfce panel"
HOMEPAGE="https://github.com/dlzr/xfce4-netgraph-plugin"
# Use the correct format for git repositories
SRC_URI="https://github.com/dlzr/xfce4-netgraph-plugin.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="
    x11-libs/gtk+:3
    dev-libs/glib:2
    net-analyzer/ifstat
    xfce-base/libxfce4ui
    dev-util/intltool
    sys-devel/gettext
    dev-build/automake
    dev-build/autoconf
"

RDEPEND="${DEPEND}"

# Required for building from source using autogen.sh
BDEPEND="
    dev-build/automake
    dev-build/autoconf
    dev-util/pkgconf
"

src_prepare() {
    # Auto-generate the necessary build files
    ./autogen.sh || die "Autogen failed"
}

src_compile() {
    # Build the plugin
    emake || die "Make failed"
}

src_install() {
    # Install the plugin
    emake DESTDIR="${D}" install || die "Install failed"
}

pkg_postinst() {
    # No post-installation actions required.
    echo "To enable the plugin, add it to your XFCE panel."
}
