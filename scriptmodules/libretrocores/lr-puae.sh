#!/usr/bin/env bash

# This file is part of The RetroPie Project
#
# The RetroPie Project is the legal property of its developers, whose names are
# too numerous to list here. Please refer to the COPYRIGHT.md file distributed with this source.
#
# See the LICENSE.md file at the top-level directory of this distribution and
# at https://raw.githubusercontent.com/RetroPie/RetroPie-Setup/master/LICENSE.md
#

rp_module_id="lr-puae"
rp_module_desc="P-UAE Amiga emulator port for libretro"
rp_module_help="ROM Extensions: .adf .uae .lha .adz\n\nCopy your roms to $romdir/amiga and $romdir/amigacd32"
rp_module_licence="GPL2 https://raw.githubusercontent.com/libretro/PUAE/master/COPYING"
rp_module_section="exp"

function sources_lr-puae() {
    gitPullOrClone "$md_build" https://github.com/libretro/libretro-uae.git
}

function build_lr-puae() {
    make
    md_ret_require="$md_build/puae_libretro.so"
}

function install_lr-puae() {
    md_ret_files=(
        'puae_libretro.so'
        'README'
    )
}

function configure_lr-puae() {
    mkRomDir "amiga"
    ensureSystemretroconfig "amiga"
    addEmulator 1 "$md_id" "amiga" "$md_inst/puae_libretro.so"
    addSystem "amiga"

    mkRomDir "amigacd32"
    ensureSystemretroconfig "amigacd32"
    addEmulator 1 "$md_id" "amigacd32" "$md_inst/puae_libretro.so"
    addSystem "amigacd32" "Amiga CD-32" ".adf .lha"
}
