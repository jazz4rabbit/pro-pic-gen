# pro-pic-gen
Profile Picture Generator from image of `twemoji`.

<img src="./images/1f41b.svg" alt="emoji_u1f41b normal image" width="64px" height="64px">

## How to Generate
1. Pick the [image][twemoji] and you can get unicode.  
(e.g. `U+1F41B` is <img src="./images/1f41b.svg" alt="emoji_u1f41b small image" width="32px" height="32px"/>(Bug) and the image is `twemoji/svg/emoji_u1f41b.svg`.
2. Convert `svg` to `1f41b_profile_512.png` (512x512 or a specific size).
3. Convert `svg` to `1f41b.ico` (256, 192, 128, 96, 64, 48, 40, 32, 24, 16).
```bash
brew install https://github.com/Homebrew/homebrew-core/raw/46a2ef7c9f0380b8e19f8dfe37270caa27581353/Formula/imagemagick.rb --with-librsvg    # actually, `brew install imageMagick` doesn't work properly>

# clone twemoji
git clone --depth 1 --branch v13.0.0 \
    https://github.com/twitter/twemoji.git
cp ./twemoji/assets/svg/${ucode}.svg ./images/${ucode}.svg

ucode="1f41b"
# you may check input image size
# identify ${ucode}.svg

# generate png image (input: 128x128, target: 512x512)
# There aren't "magic" parameter.
magick -background transparent -density "%[fx:96*512/36]" ./images/${ucode}.svg ./images/${ucode}_profile_512.png
# generate ico image (compress images using icon:auto-resize parameter)
magick -density "%[fx:96*256/36]" -background transparent favicon.svg \
    -define icon:auto-resize -colors 256 favicon.ico
```

Also, You can check the `1f41b.ico`.
```bash
identify 1f41b.ico

# log
1f41b.ico[0] PNG 256x256 256x256+0+0 8-bit sRGB 13268B 0.000u 0:00.000
1f41b.ico[1] ICO 192x192 192x192+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[2] ICO 128x128 128x128+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[3] ICO 96x96 96x96+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[4] ICO 64x64 64x64+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[5] ICO 48x48 48x48+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[6] ICO 40x40 40x40+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[7] ICO 32x32 32x32+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[8] ICO 24x24 24x24+0+0 8-bit sRGB 0.000u 0:00.000
1f41b.ico[9] ICO 16x16 16x16+0+0 8-bit sRGB 312370B 0.000u 0:00.000
```

## Q: Is Jordy a :bug:?<br />A: :t-rex:...
[<img src="./images/IS_JORDY_A_BUG.jpg" alt="Is jordy a bug?" width="512px">][jordy_official]

## Reference
[jordy official][jordy_official]

## License
This code is under the [MIT License](./LICENSE).

[jordy_official]: https://www.instagram.com/niniz_official
[twemoji]: https://twitter.github.io/twemoji/v/13.0.0/preview.html
