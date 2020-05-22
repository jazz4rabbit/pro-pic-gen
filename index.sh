#!/bin/bash

if [ ! -x "$(which magick)" ] && [ "$(uname -s)" == "Darwin" ] ; then
    brew install https://github.com/Homebrew/homebrew-core/raw/46a2ef7c9f0380b8e19f8dfe37270caa27581353/Formula/imagemagick.rb --with-librsvg
fi

# bug penguin anger
# 1f41b 1f4a2 1f427
ucode="1f41b"
mkdir -p images


if [ ! -d "twemoji" ] ; then
    git clone --depth 1 --branch v13.0.0 \
    https://github.com/twitter/twemoji.git
fi
cp ./twemoji/assets/svg/${ucode}.svg ./images/${ucode}.svg

magick -background transparent -density "%[fx:96*512/36]" ./images/${ucode}.svg ./images/${ucode}_profile_512.png
# generate ico image (compress images using icon:auto-resize parameter)
magick -density "%[fx:96*256/36]" -background transparent ./images/${ucode}.svg \
    -define icon:auto-resize -colors 256 ./images/${ucode}.ico
echo "pro-pic-gen completed"
