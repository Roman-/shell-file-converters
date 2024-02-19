#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $1 <input_filename> [output_filename]"
}

# Check for command availability
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 could not be found, please install it first."
        exit 1
    fi
}

###################################################
#                from PNG                         #
###################################################

png2ico() {
    [ $# -ge 1 ] || { usage "png2ico"; return 1; }
    check_command convert
    local output=${2:-${1%.png}.ico}
    convert "$1" -resize 256x256 "$output"
}

png2jpg() {
    [ $# -ge 1 ] || { usage "png2jpg"; return 1; }
    check_command convert
    local output=${2:-${1%.png}.jpg}
    convert "$1" "$output"
}

###################################################
#                from JPG                         #
###################################################

jpg2png() {
    [ $# -ge 1 ] || { usage "jpg2png"; return 1; }
    check_command convert
    local output=${2:-${1%.jpg}.png}
    convert "$1" "$output"
}

###################################################
#                from webp                        #
###################################################

webp2png() {
    [ $# -ge 1 ] || { usage "webp2png"; return 1; }
    check_command dwebp
    local output=${2:-${1%.webp}.png}
    dwebp "$1" -o "$output"
}

###################################################
#                from PDF                         #
###################################################


pdf2png() {
    [ $# -ge 1 ] || { usage "pdf2png"; return 1; }
    check_command pdftoppm
    local output=${2:-${1%.pdf}}
    pdftoppm -png "$1" "$output"
}

pdf2jpg() {
    [ $# -ge 1 ] || { usage "pdf2jpg"; return 1; }
    check_command convert
    local output=${2:-${1%.pdf}.jpg}
    convert -density 300 "$1" -quality 100 "$output"
}


###################################################
#                from md                          #
###################################################

md2pdf() {
    [ $# -ge 1 ] || { usage "md2pdf"; return 1; }
    check_command pandoc
    local output=${2:-${1%.md}.pdf}
    pandoc "$1" -o "$output"
}

md2html() {
    [ $# -ge 1 ] || { usage "md2html"; return 1; }
    check_command pandoc
    local output=${2:-${1%.md}.html}
    pandoc "$1" -o "$output"
}
