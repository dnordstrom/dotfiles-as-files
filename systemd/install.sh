#!/usr/bin/env bash

SCRIPT_PATH="$(dirname "$(realpath -s "$0")")"

mkdir -p "$HOME/.config/systemd/user/"

for filename in "$SCRIPT_PATH"/user/*; do
  ln -sf "$filename" "$HOME/.config/systemd/user/"
done
