# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit cmake-multilib eutils git-r3

DESCRIPTION="Professional movie playback and image processing software."
HOMEPAGE="http://djv.sf.net"
EGIT_REPO_URI="https://git.code.sf.net/p/djv/git"
EGIT_COMMIT="44a063755e627c70498d948478e29ffc1d3f105d"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
# IUSE="ffmpeg jpeg png quicktime tiff qt"

RDEPEND="
		>=dev-qt/qtopengl-5.3.2
		>=dev-qt/qtconcurrent-5.3.2
		>=dev-qt/linguist-tools-5.3.2
		>=dev-qt/qtsvg-5.3.2
		>=media-libs/openexr-2.2.0
		>=media-libs/glew-1.11.0
		>=media-video/ffmpeg-2.4.1
		virtual/jpeg
		>=media-libs/libpng-1.6.13
		>=media-libs/libquicktime-1.2.4
		>=media-libs/tiff-4.0.3
"

DEPEND="${RDEPEND}
	>=dev-util/cmake-2.4.4"

PATCHES=( "${FILESDIR}"/ffmpeg.patch )


S=${WORKDIR}/${P}

src_prepare() {
	cmake-utils_src_prepare
	sed -i -e "s:djvPackageThirdParty true:djvPackageThirdParty false:" CMakeLists.txt || die
	sed -e "s|^Exec.*|Exec=djv_view %U|" -i etc/Linux/djv_view.desktop.in
	sed -e "s|^Categories.*|Categories=AudioVideo;|" -i etc/Linux/djv_view.desktop.in
}

src_install() {
#	rm etc/Linux/djv_view.desktop
	cmake-multilib_src_install
}
