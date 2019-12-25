# Starts Cava audio visualizer in a terminal window with transparent background.
function start_cava
  urxvt -bg rgba:1000/1000/1000/0000 -T transparent_term -e cava
end
