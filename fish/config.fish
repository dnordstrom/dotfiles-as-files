#
# Fish Shell Configuration
#   See `functions` directory for specific functions.
#

#
# Paths
#

# Path directories
add_to_path /var/lib/flatpak/exports/bin
add_to_path (yarn global bin)
add_to_path $HOME/.local/bin
add_to_path $HOME/go/bin

# XDG data directories
add_to_xdg_data /var/lib/flatpak/exports/share
add_to_xdg_data $HOME/.local/share
add_to_xdg_data /usr/local/share
add_to_xdg_data /usr/share

#
# Includes
#

source $__fish_config_dir/abbreviations.fish
source $__fish_config_dir/aliases.fish

#
# Powerline
#

set -x POWERLINE_BASH_CONTINUATION 1
set -x POWERLINE_BASH_SELECT 1
set -x POWERLINE_CONFIG_COMMAND powerline-config
powerline-daemon -q

if status is-interactive
  set FLINE_PATH $HOME/.config/fish/fishline
  source $FLINE_PATH/init.fish
end

#
# FZF & FD
#

set -x FZF_DEFAULT_COMMAND 'fd --hidden --type f --exclude .git'
set -x FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

#
# XDG
#

set -x XDG_SESSION_TYPE wayland
set -x XDG_CURRENT_DESKTOP sway

#
# Miscellaneous
#

# 1Password
set -x OP_SESSION_my GZ02dlBObGDXHvY_OAWRmzAxbU6N8awPcrwVJQqDFys

#
# Startup
#

# Start Sway if running from tty1
if test (tty) = "/dev/tty1"
  exec sway-init
end
