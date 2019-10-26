#
# Aliases
#

alias code="env GDK_BACKEND=x11 code-insiders"
alias edit-dotfiles="code ~/Code/dotfiles"
alias start-plasma="kwin_wayland --drm --libinput --xwayland
/usr/lib64/startplasma"
alias start-transparent-term="urxvt -bg rgba:1000/1000/1000/0000 -T transparent_term"
alias start-cava="urxvt -bg rgba:1000/1000/1000/0000 -T transparent_term -e cava"
alias remove-orphan-packages="sudo pacman -Rns (pacman -Qtdq)"
alias set-cpu-performance="echo performance | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"
alias set-cpu-schedutil="echo schedutil | sudo tee /sys/devices/system/cpu/cpu*/cpufreq/scaling_governor"


#
# Functions
#

# Disable greeting
function fish_greeting
end

# AUR helper
function aur
  cd $HOME/Downloads && git clone https://aur.archlinux.org/$argv.git && cd $argv && makepkg -si
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
