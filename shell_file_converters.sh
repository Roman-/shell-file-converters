#!/bin/bash

# Function to display _usage
_usage() {
    echo "Usage: $1 <input_filename> [output_filename]"
}

# Check for command availability
_check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 could not be found, please install it first."
        exit 1
    fi
}

_confirm_overwrite() {
    if [ -f "$1" ]; then
        while true; do
            echo -n "File $1 exists. Do you want to overwrite it? (y/n) "
            read -r answer
            case $answer in
                [Yy]* ) break;; # proceeding
                [Nn]* ) echo "Operation aborted."; return 1;;
                * ) echo "Please answer yes (y) or no (n).";;
            esac
        done
    fi
}

###################################################
#                from PNG                         #
###################################################

png2ico() {
    [ $# -ge 1 ] || { _usage "png2ico"; return 1; }
    _check_command convert
    local output=${2:-${1%.png}.ico}
    _confirm_overwrite "$output"
    convert "$1" -resize 256x256 "$output"
}

png2jpg() {
    [ $# -ge 1 ] || { _usage "png2jpg"; return 1; }
    _check_command convert
    local output=${2:-${1%.png}.jpg}
    convert "$1" "$output"
}

###################################################
#                from JPG                         #
###################################################

jpg2png() {
    [ $# -ge 1 ] || { _usage "jpg2png"; return 1; }
    _check_command convert
    local output=${2:-${1%.jpg}.png}
    _confirm_overwrite "$output"
    convert "$1" "$output"
}

###################################################
#                from webp                        #
###################################################

webp2png() {
    [ $# -ge 1 ] || { _usage "webp2png"; return 1; }
    _check_command dwebp
    local output=${2:-${1%.webp}.png}
    _confirm_overwrite "$output"
    dwebp "$1" -o "$output"
}

###################################################
#                from PDF                         #
###################################################


pdf2png() {
    [ $# -ge 1 ] || { _usage "pdf2png"; return 1; }
    _check_command pdftoppm
    local output=${2:-${1%.pdf}}
    _confirm_overwrite "$output"
    pdftoppm -png "$1" "$output"
}

pdf2jpg() {
    [ $# -ge 1 ] || { _usage "pdf2jpg"; return 1; }
    _check_command convert
    local output=${2:-${1%.pdf}.jpg}
    _confirm_overwrite "$output"
    convert -density 300 "$1" -quality 100 "$output"
}


###################################################
#                from md                          #
###################################################

md2pdf() {
    [ $# -ge 1 ] || { _usage "md2pdf"; return 1; }
    _check_command pandoc
    local output=${2:-${1%.md}.pdf}
    _confirm_overwrite "$output"
    pandoc "$1" -o "$output"
}

md2html() {
    [ $# -ge 1 ] || { _usage "md2html"; return 1; }
    _check_command pandoc
    local output=${2:-${1%.md}.html}
    _confirm_overwrite "$output"
    pandoc "$1" -o "$output"
}
