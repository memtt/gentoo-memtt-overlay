# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

# TODO: drop autotools + eautoreconf after 0.11.4
inherit autotools

DESCRIPTION="Text to speech voice sinthesizer from SVox, included in Android AOSP."
HOMEPAGE="https://github.com/ihuguet/picotts"
SRC_URI="https://github.com/ihuguet/picotts/archive/21089d223e177ba3cb7e385db8613a093dff74b5.zip"

LICENSE="APACHE-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

REQUIRED_USE=""

DEPEND=""
RDEPEND="${DEPEND}"
BDEPEND=""
PATCHES=()

S="${WORKDIR}/picotts-21089d223e177ba3cb7e385db8613a093dff74b5/pico"

src_prepare() {
	default

	eautoreconf
}

src_configure() {
	local myeconfargs=(
	)
	econf "${myeconfargs[@]}"
}

src_compile() {
	emake
}

src_install() {
	default
}
