#
# Fish Shell Configuration
#   See `functions` directory for specific functions.
#

#
# Variables
#

# 1Password
set -x OP_SESSION_my GZ02dlBObGDXHvY_OAWRmzAxbU6N8awPcrwVJQqDFys

# n version manager
set -x N_PREFIX "$HOME/.n"

# Golang
set -x GOPATH "$HOME/.go"



#
# Paths
#

# Path directories
add_to_path /var/lib/flatpak/exports/bin
add_to_path $HOME/.local/bin
add_to_path $N_PREFIX/bin
add_to_path (yarn global bin)
add_to_path $HOME/.go/bin
add_to_path $HOME/.cargo/bin

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
# Startup
#

# Start Sway if running from tty1
if test (tty) = "/dev/tty1"
  exec sway
end
