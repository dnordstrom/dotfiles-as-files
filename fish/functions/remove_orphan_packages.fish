function remove_orphan_packages
  sudo pacman -Rns (pacman -Qtdq)
end
