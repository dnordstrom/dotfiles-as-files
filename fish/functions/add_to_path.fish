# Adds directory to PATH if it's valid and not already included.
function add_to_path
  set target "$argv[1]"

  if test -d $target; and not contains $target $PATH
    set -gx PATH $target $PATH
  end
end
