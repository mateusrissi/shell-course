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
#      $ ./file_organizer.sh /path/to/dir
#      Command description.
#
# --------------------------------------------------------------------------- #
# History:
#
#   v1.0 03/12/2019, Mateus:
#       - Start
#       - Funcionalities
#
# --------------------------------------------------------------------------- #
# Tested on:
#   bash 4.4.20
#
# --------------------------------------------------------------------------- #

# -------------------------------- VARIABLES -------------------------------- #
FOLDERS="Compressed Documents Images Music Videos"

declare -A EXTENSIONS_DIC=(
    ["Compressed"]="*.7z *.arj *.deb *.pkg *.rar *.rpm *.tar.gz *.zip *.z"
    ["Documents"]="*.ppt *.pptx *.odp *.xls *.xlsx *.ods *.doc *.docx \
                   *.odt *.pdf *.rtf *.txt"
    ["Images"]="*.psd *.xcf *.tif *.tiff *.bmp *.jpg *.jpeg *.gif *.png"
    ["Music"]="*.wav *.mp3 *.ogg *.gsm *.dct *.flac *.au *.aiff *.vox"
    ["Videos"]="*.avi *.flv *.wmv *.mp4 *.mov"
)

DIR="${1}"

# ---------------------------------- TESTS ---------------------------------- #
if [[ $(ls ${DIR} | wc -l) -eq 0 ]]; then
    echo "There are no files in the specified folder" && exit 0
fi

# -------------------------------- FUNCTIONS -------------------------------- #
organizer() {
    for i in ${FOLDERS[@]}; do
        for ext in ${EXTENSIONS_DIC[${i}]}; do
            for line in `ls ${DIR} | grep ${ext}`; do
                mv "${DIR}${line}" "${DIR}${i}"
            done
        done
    done
}

folder_creater() {
    for i in ${FOLDERS[@]}; do
        [[ -d "${DIR}${i}" ]] || mkdir "${DIR}${i}"
    done
}

main() {
    folder_creater
    organizer
    echo "Successfully organized the directory!"
}

# ----------------------------------- EXEC ---------------------------------- #

main
