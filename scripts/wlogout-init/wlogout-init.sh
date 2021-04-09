#!/usr/bin/env sh

BUTTONS_PER_ROW=2
SPACING=34

wlogout \
  --buttons-per-row $BUTTONS_PER_ROW \
  --row-spacing $SPACING \
  --column-spacing $SPACING \
  --margin $SPACING \
  --protocol layer-shell
