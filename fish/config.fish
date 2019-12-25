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

# Disable greeting
function fish_greeting
end



#
# Miscellaneous
#

# Add Yarn global executables to path (array format)
set -gx PATH /var/lib/flatpak/exports/bin (yarn global bin) $PATH

# Add Flatpak to XDG data directories (comma delimited string format)
set -gx XDG_DATA_DIRS /var/lib/flatpak/exports/share:$HOME/.local/share:/usr/local/share:/usr/share

# Start Sway if running from tty1
if test (tty) = "/dev/tty1"
  exec sway
end
