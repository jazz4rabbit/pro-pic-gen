#!/bin/bash

if [ ! -x "$(which magick)" ] && [ "$(uname -s)" == "Darwin" ] ; then
brew install https://github.com/Homebrew/homebrew-core/raw/46a2ef7c9f0380b8e19f8dfe37270caa27581353/Formula/imagemagick.rb --with-librsvg
fi

ucode="u1f41b"
mkdir -p images


if [ ! -d "noto-emoji" ] ; then
git clone --depth 1 --branch v2020-04-08-unicode12_1 \
    https://github.com/googlefonts/noto-emoji.git
fi
cp ./noto-emoji/svg/emoji_${ucode}.svg ./images/favicon.svg

magick -background transparent -density "%[fx:96*512/128]" ./images/favicon.svg ./images/profile.png
# generate ico image (compress images using icon:auto-resize parameter)
magick -density "%[fx:96*256/128]" -background transparent ./images/favicon.svg \
    -define icon:auto-resize -colors 256 ./images/favicon.ico
echo "pro-pic-gen completed"
