#!/bin/bash

# Function to display usage
usage() {
    echo "Usage: $1 <input_filename> [output_filename]"
}

# Check for command availability
check_command() {
    if ! command -v $1 &> /dev/null; then
        echo "$1 could not be found, please install it."
        exit 1
    fi
}

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
