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
