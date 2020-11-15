#!/usr/bin/env bash
#
# Some sane defaults for sending notifications.
#

set -eu

MESSAGE=""
OPTION_HELP=false
USAGE="USAGE:
    $(basename "$0") [options]

DESCRIPTION:
    Send a desktop notification to a notification daemon such as Mako.

OPTIONS:
    --help, -h        Show this help text
    --message, -m           Notification message"

# Parse flags and parameters. Credit to Richard Blechinger, see article at:
# https://pretzelhands.com/posts/command-line-flags
for arg in "$@"
do
  case $arg in
    -h|--help)
    OPTION_HELP=true
    shift
    ;;
    *)
    MESSAGE+=" $1"
    shift
    ;;
  esac
done

# Show help if the --help (or -h) flag is used
if [ "$OPTION_HELP" = true ]; then
  echo "$USAGE"
  exit 0
fi

notify-send -t 2000 --urgency=low --icon=gtk-dialog-info "MESSAGE"
