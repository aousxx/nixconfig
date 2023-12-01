#!/bin/bash
color=$(grep "base01:" "$HOME/.config/flavours/item-files/telegram/colors.tdesktop-theme" | cut -d: -f2 | sed "s/;//")
echo $color
#convert -size 1x1 xc:"$color" "$HOME/.config/flavours/item-files/telegram/background.png"

convert  "$HOME/.config/flavours/item-files/telegram/ogbackground.png" \( -clone 0 -fill $color -colorize 100 \) -compose multiply -composite  "$HOME/.config/flavours/item-files/telegram/background.png"
zip -j "$HOME/.config/flavours/item-files/telegram/temp-final.tdesktop-theme" "$HOME/.config/flavours/item-files/telegram/colors.tdesktop-theme" "$HOME/.config/flavours/item-files/telegram/background.png"
mv "$HOME/.config/flavours/item-files/telegram/temp-final.tdesktop-theme" "$HOME/.config/flavours/item-files/telegram/final.tdesktop-theme" 
