#!/bin/bash

# Function to display Usage
_sfc_usage() {
    echo "Usage: $1 <input_filename> [output_filename]"
}

# Check for command availability
_sfc_check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 could not be found, please install it first."
        return 1
    fi
}

# Confirm overwriting existing file, if any
_sfc_confirm() {
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
    [ $# -ge 1 ] || { _sfc_usage "png2ico"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.png}.ico}
    _sfc_confirm "$output" || return 1
    convert "$1" -resize 256x256 "$output"
}

png2jpg() {
    [ $# -ge 1 ] || { _sfc_usage "png2jpg"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.png}.jpg}
    _sfc_confirm "$output" || return 1
    convert "$1" "$output"
}

###################################################
#                from JPG                         #
###################################################

jpg2png() {
    [ $# -ge 1 ] || { _sfc_usage "jpg2png"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.jpg}.png}
    _sfc_confirm "$output" || return 1
    convert "$1" "$output"
}

###################################################
#                from webp                        #
###################################################

webp2png() {
    [ $# -ge 1 ] || { _sfc_usage "webp2png"; return 1; }
    _sfc_check_command dwebp || return 1
    local output=${2:-${1%.webp}.png}
    _sfc_confirm "$output" || return 1
    dwebp "$1" -o "$output"
}

###################################################
#                from PDF                         #
###################################################

pdf2png() {
    [ $# -ge 1 ] || { _sfc_usage "pdf2png"; return 1; }
    _sfc_check_command pdftoppm || return 1
    local output=${2:-${1%.pdf}}
    _sfc_confirm "$output" || return 1
    pdftoppm -png "$1" "$output"
}

pdf2jpg() {
    [ $# -ge 1 ] || { _sfc_usage "pdf2jpg"; return 1; }
    _sfc_check_command convert || return 1
    local output=${2:-${1%.pdf}.jpg}
    _sfc_confirm "$output" || return 1
    convert -density 300 "$1" -quality 100 "$output"
}


###################################################
#                from md                          #
###################################################

md2pdf() {
    [ $# -ge 1 ] || { _sfc_usage "md2pdf"; return 1; }
    _sfc_check_command pandoc || return 1
    local output=${2:-${1%.md}.pdf}
    _sfc_confirm "$output"
    pandoc "$1" -o "$output"
}

md2html() {
    [ $# -ge 1 ] || { _sfc_usage "md2html"; return 1; }
    _sfc_check_command pandoc || return 1
    local output=${2:-${1%.md}.html}
    _sfc_confirm "$output"
    pandoc "$1" -o "$output"
}

###################################################
#                from FLAC                        #
###################################################

flac2mp3() {
    [ $# -ge 1 ] || { _sfc_usage "flac2mp3"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.flac}.mp3}
    _sfc_confirm "$output"
    ffmpeg -i "$1" -ab 320k "$output"
}

flac2wav() {
    [ $# -ge 1 ] || { _sfc_usage "flac2wav"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.flac}.wav}
    _sfc_confirm "$output"
    ffmpeg -i "$1" "$output"
}

###################################################
#                from MP4                         #
###################################################

mp42mp3() {
    [ $# -ge 1 ] || { _sfc_usage "mp42mp3"; return 1; }
    _sfc_check_command ffmpeg || return 1
    local output=${2:-${1%.mp4}.mp3}
    _sfc_confirm "$output" || return 1
    ffmpeg -i "$1" -q:a 0 -map a "$output"
}
