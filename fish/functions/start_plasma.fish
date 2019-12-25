# Starts KDE Plasma without using a login manager.
function start_plasma
  kwin_wayland --drm --libinput --xwayland /usr/lib64/startplasma
end
