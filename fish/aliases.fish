#
# Fish shell aliases basically define functions that run other functions
#

alias sway-windows="swaymsg -t get_tree | jq -r 'recurse(.nodes[]) | .nodes[].window_properties'"
alias dev-t="cd ~/Code/ticker && yarn && yarn dev"
alias dev-tb="cd ~/Code/ticker-backend && source .env && yarn && yarn dev"
alias dev-proxies="cd ~/Code/"
