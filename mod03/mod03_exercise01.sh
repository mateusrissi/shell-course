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
#      $ ./file_organizer.sh -d /path/to/dir
#      The flag '-d' means that the next argument will be taken as the dir that
#      will be organized.
#
# --------------------------------------------------------------------------- #
# History:
#
#   v1.1.0 03/12/2019, Mateus:
#       - Start
#       - Funcionalities
#   v1.1.0 04/12/2019, Mateus:
#       - Added flags
#          - Now it works properly
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

DIR=""

VERSION="v1.1.0"

HELP_MESSAGE="
    $(basename $0) - [OPTIONS]

        -h - Help menu
        -v - Version
"

# ---------------------------------- TESTS ---------------------------------- #
while test -n "${1}"; do
    case "${1}" in
        -h) echo "${HELP_MESSAGE}" && exit 0                           ;;
        -v) echo "${VERSION}" && exit 0                                ;;
        -d) shift && DIR="${1}"                                        ;;
         *) echo "Invalid option '${1}'! Use '-h' for help." && exit 1 ;;
    esac
    shift
done

if [[ ! -d ${DIR} ]]; then
    echo "The specified directory does not exist!" && exit 1
fi

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
        if [[ ! -d "${DIR}${i}" ]]; then
            mkdir "${DIR}${i}"
        fi
    done
}

main() {
    folder_creater
    organizer
    echo "Successfully organized the directory!"
}

# ----------------------------------- EXEC ---------------------------------- #

main
