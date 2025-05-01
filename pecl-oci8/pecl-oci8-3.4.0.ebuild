EAPI="8"

PHP_EXT_NAME="oci8"
PHP_EXT_PECL_PKG="oci8"
PHP_EXT_INI="yes"
PHP_EXT_ZENDEXT="no"
PHP_INI_NAME="50-oci8"
PHP_EXT_NEEDED_USE="-oci8-instant-client(-)"

USE_PHP="php8-4"

inherit php-ext-pecl-r3

DESCRIPTION="Extended HTTP Support for PHP"
LICENSE="BSD-2 MIT"
SLOT="8"
KEYWORDS="amd64 x86"

DEPEND="dev-db/oracle-instantclient:="
RDEPEND="${DEPEND}"

PHP_EXT_ECONF_ARGS=( --with-oci8=shared,instantclient,/usr/lib64/oracle/client/lib64 )

src_prepare() {
        php-ext-source-r3_src_prepare
}
