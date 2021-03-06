# Copyright 1999-2017 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=6

inherit git-r3

DESCRIPTION="Blender addon. Align Selection To Gpencil Stroke"
HOMEPAGE="https://blenderartists.org/forum/showthread.php?332160-Addon-Align-Selection-to-Grease-Pencil"
EGIT_REPO_URI="https://github.com/meta-androcto/blenderpython.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND="media-gfx/blender[addons]"

src_install() {
	if VER="/usr/share/blender/*";then
		insinto ${VER}/scripts/addons/
		doins -r "${S}"/scripts/addons_extern/mesh_align_to_gpencil_view.py
	fi
}
