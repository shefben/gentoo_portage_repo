EAPI=8

inherit git-r3

# Points to the Git repository for E-MailRelay. Adjust EGIT_BRANCH if the repo’s default branch isn’t "master".
EGIT_REPO_URI="https://github.com/aclemons/emailrelay.git"
EGIT_BRANCH="master"

DESCRIPTION="E-MailRelay - A lightweight SMTP store-and-forward mail server with POP access"
HOMEPAGE="https://github.com/aclemons/emailrelay"
LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="pam ssl"

# Build-time and runtime dependencies.
DEPEND="
    dev-util/pkgconf
    pam? ( sys-libs/pam )
    ssl? ( dev-libs/openssl )
"
RDEPEND="${DEPEND}"

# For git-r3 ebuilds, the source is checked out into ${WORKDIR}/git.
#S="${WORKDIR}/git"
S="${WORKDIR}/${P}"

src_configure() {
    econf \
        $(use_enable pam) \
        $(use_enable ssl tls)
}

src_compile() {
    emake
}

src_install() {
    default
    dodoc README.md doc/userguide.md
}
