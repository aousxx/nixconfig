#!/bin/sh

wallpaperdir="$HOME/Aws/Pictures/wallpapers/anime"

files=($wallpaperdir/*)
randompic="$wallpaperdir/$(ls $wallpaperdir | shuf -n 1)"

echo "$randompic"
swww img $randompic --transition-type=wave
flavours generate dark $randompic
flavours apply generated $1
wpg -s $randompic
