#!/usr/bin/env bash
#
# Initialization script for launching `swaylock` and `swaylock-effects`.
#
# USAGE:
#   $ ./install.sh
#   $ swaylock-init
#

set -Eeuo pipefail

screenshot_image="$(mktemp).png"
text_image="$(mktemp).png"
colorize_fill="#1f2430"
width=$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .current_mode.width')

# Screenshot focused screen
grim -o "$(swaymsg -t get_outputs | jq -r '.[] | select(.focused) | .name')" "${screenshot_image}"

# Add blur to screenshot
convert -filter Gaussian -resize 50% -blur 0x1 -resize 200% -fill "$colorize_fill" -colorize 90% "${screenshot_image}" "${screenshot_image}"

# Use argument if provided
if [ $# -gt 0 ]; then
  if [ -f "$1" ]; then
    # If argument is a file, insert it on top of the screenshot
    convert "${screenshot_image}" "$1" \
      -gravity center \
      -composite "${screenshot_image}"
  else
    # If argument is not a file, treat it as text and create an annotation image
    convert -size "${width}x100" xc:gray \
      -font "Iosevka" \
      -pointsize 48 \
      -fill white \
      -alpha activate \
      -gravity center \
      -kerning 5 \
      -annotate +0+0 "$1" "${text_image}"
  
    # Overlay annotation on screenshot
    convert "${screenshot_image}" "${text_image}" -gravity center -geometry +0+0 -composite "${screenshot_image}"
  fi
fi

# Provided a cardinal number as parameter, this function will returns its
# ordinal counterpart.
getOrdinalNumber() {
  if [ $# -gt 0 ]; then
    case "$1" in
      1?) echo "$1th" ;;
      *1) echo "$1st" ;;
      *2) echo "$1nd" ;;
      *3) echo "$1rd" ;;
      *) echo "$1th" ;;
    esac
  fi
}

# Provided a cardinal number as parameter, this function returrns its ordinal
# suffix (such as "st" or "nd").
getOrdinalSuffix() {
  getOrdinalNumber "$1" | sed -e 's/[0-9]//g' # Remove any actual digits
}

# Start default `swaylock`
# swaylock \
#   --font "SF Text Pro" \
#   --font-size 14 \
#   --scaling fill \
#   --ignore-empty-password \
#   --indicator-radius 150 \
#   --indicator-thickness 8 \
#   --inside-color "#1f2430" \
#   --inside-ver-color "#1f2430" \
#   --key-hl-color "#ffcc66" \
#   --ring-color "#1f2430" \
#   --ring-ver-color "#1f2430" \
#   --separator-color "#1f2430" \
#   --line-uses-inside \
#   --layout-bg-color "#00000000" \
#   --layout-border-color "#00000000" \
#   --layout-text-color "#ffffff" \
#   --image "${screenshot_image}"

# Start `swaylock-effects` fork of `swaylock`. Line `--clock` and below are
# specific to this fork.
swaylock \
  --font "Iosevka Heavy" \
  --font-size 14 \
  --scaling fill \
  --ignore-empty-password \
  --indicator-radius 150 \
  --indicator-thickness 8 \
  --inside-color "#1f2430" \
  --inside-ver-color "#1f2430" \
  --key-hl-color "#ffcc66" \
  --ring-color "#1f2430" \
  --ring-ver-color "#1f2430" \
  --separator-color "#1f2430" \
  --line-uses-inside \
  --layout-bg-color "#00000000" \
  --layout-border-color "#00000000" \
  --layout-text-color "#ffffff" \
  --clock \
  --screenshots \
  --indicator-idle-visible \
  --datestr "%H:%M" \
  --timestr "%A the $(getOrdinalNumber "$(date '+%-d')")" \
  --grace 10 \
  --fade-in 1 \
  --effect-greyscale \
  --effect-pixelate 2x5 \
  --effect-vignette 0.3:0.1
