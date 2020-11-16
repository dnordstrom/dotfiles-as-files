#!/usr/bin/env bash
#
# Simple color picker that will copy the color to clipboard (and show it in a notification, if such a daemon is installed). By default it copies the color in hex format, but flags can be used to specify another format.
#
# USAGE:
#   `./snap_area.sh [TARGET FILE]`
#

set -eu

ERRORS=false
OPTION_HEX=true
OPTION_RGB=false
OPTION_HELP=false
HAS_NOTIFY=false
HAS_CONVERT=false
HAS_COPY=false
USAGE="USAGE:
    $(basename "$0") [options]

DESCRIPTION:
    Click anywhere on the screen to get the color copied to clipboard (and a notificaion shown on screen if mako or similar is installed). You may specify which color format to receive using the flags (hex is default).

OPTIONS:
    --help, -h    Show this help text
    --hex, -x     Get color in hex format (default)
    --rgb, r      Get color in RGB format"

# Check dependencies
! [ -x "$(command -v notify-send)" ] || HAS_NOTIFY=true
! [ -x "$(command -v convert)" ] || HAS_CONVERT=true
! [ -x "$(command -v wl-copy)" ] || HAS_COPY=true

if [ "$HAS_CONVERT" = false ]; then
  echo "Cannot find convert command. Please make sure ImageMagick is installed."
  exit 1
fi

# Parse flags and parameters. Credit to Richard Blechinger, see article at:
# https://pretzelhands.com/posts/command-line-flags
for arg in "$@"
do
  case $arg in
    -x|--hex)
    OPTION_HEX=true
    shift
    ;;
    -r|--rgb)
    OPTION_RGB=true
    shift
    ;;
    *)
    TARGET+=("$1")
    shift
    ;;
  esac
done

# Show help if the --help (or -h) flag is used
if [ "$OPTION_HELP" = true ]; then
  echo "$USAGE"
  exit 0
fi

COLOR=$(grim -g "$(slurp -p)" -t ppm - | convert - -format '%[pixel:p{0,0}]' txt:- | tail -n 1) 2>/dev/null

if [ "$OPTION_RGB" = true ]; then
  # RGB value
  OUTPUT="rgb$(echo $COLOR | cut -d' ' -f2)"
else
  # Hex value
  OUTPUT="$(echo $COLOR | cut -d' ' -f3)"
fi

if [ "$HAS_NOTIFY" = true ]; then
  notify-send -a "Color Snap" -t 2000 --urgency=low --icon=gtk-dialog-info "$OUTPUT"
fi

if [ "$HAS_COPY" = true ]; then
  wl-copy "$OUTPUT"
fi

if $ERRORS; then
	exit 1
fi

exit 0
