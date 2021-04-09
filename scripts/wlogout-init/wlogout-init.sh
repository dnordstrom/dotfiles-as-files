#!/usr/bin/env sh

BUTTONS_PER_ROW=2
SPACING=32

wlogout \
  --buttons-per-row $BUTTONS_PER_ROW \
  --row-spacing $SPACING \
  --column-spacing $SPACING \
  --margin $SPACING
