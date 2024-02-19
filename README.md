# Shell Converter 🛠️

Welcome to the Shell Converter Toolkit! This bash script provides a set of simple, yet powerful command-line functions for converting images and PDF files into different formats.

## Features 🌟

- Convert PNG images to ICO format
- Convert PNG images to JPG format
- Convert PDF documents to PNG images
- Convert PDF documents to JPG images
- ... more to come!

Here's a README.md template for your GitHub project that incorporates the improved bash script for file conversions:

## Prerequisites 📋

Before you start using the File Converter Toolkit, make sure you have the following installed:

- ImageMagick (for `convert` command)
- Poppler-utils (for `pdftoppm` command)

```bash
sudo apt-get install imagemagick poppler-utils
```

## Installation 🚀

Simply source this script in your `bashrc`:

```bash
source /path/to/shell_converter.sh
```

## Usage 📖

### PNG to ICO

```sh
png2ico input.png
```

### PNG to JPG

```sh
png2jpg input.png
```

### PDF to PNG

```sh
pdf2png document.pdf
```

### PDF to JPG

```sh
pdf2jpg document.pdf
```

## Contributions Welcome! 🤝

This project thrives on your contributions! Whether it's adding new features, improving existing ones, or fixing bugs, all contributions are welcome. If you have ideas on how to make this toolkit even better, don't hesitate to fork the repo and submit a pull request, or open an issue. Let's make this File Converter Toolkit the best it can be, together! 💪

## License 📄

This project is licensed under [MIT License](LICENSE) - see the LICENSE file for details.

---

Happy Converting! 🎉
