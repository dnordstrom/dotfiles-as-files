#
# Fish shell aliases basically define functions that run other functions
#

alias ffs="pls"
alias sway-windows="swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | .nodes[].window_properties'"
