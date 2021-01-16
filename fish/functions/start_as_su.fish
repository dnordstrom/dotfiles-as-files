#!/bin/bash
# Temporarily elevates user privilige while running the specified app. It's sudo
# for application with graphical UI.
function start_as_su
  # Wrap root privileges around command
  xhost +SI:localuser:root
  sudo $argv[1]
  xhost -SI:localuser:root

  # Print access status to allow verification that root access was removed
  xhost
end
