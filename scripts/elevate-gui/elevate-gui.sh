#!/bin/bash
# Temporarily elevates user privilige while running the specified app. It's sudo
# for application with graphical UI.

set -eu

xhost +SI:localuser:root
sudo $1
xhost -SI:localuser:root

# Print access status to allow verification that root access was removed
xhost
