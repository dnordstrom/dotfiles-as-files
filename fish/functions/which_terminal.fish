# Hopefully returns the name of the terminal emulator used. Useful when you have
# multiple terminal emulators installed and themed to look exactly the same with
# no window decorations or menu bars.
function which_terminal
  ps -o 'cmd=' -p (string trim (ps -o 'ppid=' -p $fish_pid))
end
