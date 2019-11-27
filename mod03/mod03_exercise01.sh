#!/usr/bin/env bash
#
# file_organizer.sh - Organize your files
#
# Site:       https://www.linkedin.com/in/mateusrissi/
# Author:     Mateus Rissi
# Maintainer: Mateus Rissi
#
# --------------------------------------------------------------------------- #
#  Organize your files in folders according to their extensions.
#
#  Examples:
#      $ ./file_organizer.sh directory_path
#      Command description.
#
# --------------------------------------------------------------------------- #
# History:
#
#   v1.0 27/11/2019, Mateus:
#       - Start
#       - Funcionalities
#
# --------------------------------------------------------------------------- #
# Tested on:
#   bash 4.4.20
#
# --------------------------------------------------------------------------- #

# -------------------------------- VARIABLES -------------------------------- #
FOLDERS='Compressed Documents Images Music Videos Miscellaneous'
declare -A extensionsDic=(
    ['Compressed']='*.7z *.arj *.deb *.pkg *.rar *.rpm *.tar.gz *.zip *.z'
    ['Documents']='*.ppt *.pptx *.odp *.xls *.xlsx *.ods *.doc *.docx \
                   *.odt *.pdf *.rtf *.txt'
    ['Images']='*.psd *.xcf *.tif *.tiff *.bmp *.jpg *.jpeg *.gif *.png'
    ['Music']='*.wav *.mp3 *.ogg *.gsm *.dct *.flac *.au *.aiff *.vox'
    ['Videos']='*.avi *.flv *.wmv *.mp4 *.mov'
    ['Miscellaneous']=''
)
# ---------------------------------- TESTS ---------------------------------- #
if [[ $(ls ${1} | wc -l) -eq 0 ]]; then
    echo "There are no files in the specified folder" && exit 0
fi

# -------------------------------- FUNCTIONS -------------------------------- #
organizer()={

}

# ----------------------------------- EXEC ---------------------------------- #

organizer

echo "Successfully organized directory!"
