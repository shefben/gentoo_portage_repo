# checkmk-2.4.0-b4.ebuild
EAPI=8

DESCRIPTION="Checkmk - a comprehensive IT monitoring system"
HOMEPAGE="https://github.com/Checkmk/checkmk"
SRC_URI="https://github.com/Checkmk/checkmk/archive/refs/tags/v2.4.0b4.zip -> ${P}.zip"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Required dependencies for building Checkmk
DEPEND="
    dev-python/setuptools
    dev-python/pip
    dev-build/automake
    dev-build/autoconf
    sys-devel/gcc
"

# Runtime dependencies for Checkmk
RDEPEND="
    dev-python/setuptools
    dev-python/pip
    dev-python/psutil
    sys-libs/glibc
"

# BDEPEND for build-time dependencies
BDEPEND="
    dev-python/setuptools-scm
"

src_prepare() {
    default
}

src_compile() {
    python3 setup.py build || die "Build failed"
}

src_install() {
    python3 setup.py install --root="${D}" || die "Installation failed"
}

pkg_postinst() {
    echo "Checkmk has been installed. To configure it, refer to the documentation."
}
