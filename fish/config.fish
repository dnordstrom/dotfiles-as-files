#
# Aliases
#

alias edit-dotfiles="env GDK_BACKEND=x11 code-insiders ~/Code/dotfiles"



#
# Functions
#

# Disable greeting

function fish_greeting
end



#
# Miscellaneous
#

# Add Yarn global executables to path

set -x PATH (yarn global bin) $PATH

# Configure `fuck` alias

thefuck --alias | source

# Start Sway if running from tty1

if test (tty) = "/dev/tty1"
  exec sway
end
