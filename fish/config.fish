#
# Aliases
#

# Utilities
alias remove-orphan-packages="sudo pacman -Rns (pacman -Qtdq)"
alias test-speed="speedtest-cli --server 20602"

# Launchers
alias code="env GDK_BACKEND=x11 code-insiders"
alias edit-dotfiles="code ~/Code/dotfiles"
alias start-plasma="kwin_wayland --drm --libinput --xwayland /usr/lib64/startplasma"
alias start-transparent-term="urxvt -bg rgba:1000/1000/1000/0000 -T transparent_term"
alias start-cava="urxvt -bg rgba:1000/1000/1000/0000 -T transparent_term -e cava"

# CPU scheduling
alias set-cpu-performance="echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
alias set-cpu-schedutil="echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"



#
# Functions
#

# Disables default greeting.
function fish_greeting
end

# Adds directory to PATH if it's valid and not already included.
function add_to_path
  set target "$argv[1]"

  if test -d $target; and not contains $target $PATH
    set -gx PATH $target $PATH
  end
end

# Adds directory to XDG_DATA_DIRS if it's valid and not already included.
function add_to_xdg_data
  set target "$argv[1]"

  if test -d $target; and not test -n "$XDG_DATA_DIRS"
    # XDG_DATA_DIRS is empty, let's set it
    set -gx XDG_DATA_DIRS $target
  else if test -d $target; and not string match -qe -- $target $XDG_DATA_DIRS
    # XDG_DATA_DIRS exists, append to it
    set -gx XDG_DATA_DIRS $target:$XDG_DATA_DIRS
  end
end



#
# Miscellaneous
#

# Path directories
add_to_path /var/lib/flatpak/exports/bin
add_to_path (yarn global bin)

# XDG data directories
add_to_xdg_data /var/lib/flatpak/exports/share
add_to_xdg_data $HOME/.local/share
add_to_xdg_data /usr/local/share
add_to_xdg_data /usr/share

# Start Sway if running from tty1
if test (tty) = "/dev/tty1"
  exec sway
end
