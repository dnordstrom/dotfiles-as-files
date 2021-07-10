# Tells me to use paru instead of yay in case I forget.
function yay
  echo "Use paru instead: paru $argv"
  ydotool type "paru $argv"
end
