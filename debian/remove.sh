apt-get remove --purge -y \
    gnome* \
    kde* \
    xfce* \
    lxde* \
    cinnamon* \
    mate* \
    *desktop-environment* \
    *gui* \
    *xserver* \
    xorg* \
    lightdm \
    gdm \
    sddm

sudo apt purge \
  cinnamon* \
  gnome-* \
  mate-* \
  xfce4* \
  light-locker* \
  lightdm* \
  papirus-icon-theme \
  yaru-theme-icon \
  breeze* \
  greybird-gtk-theme \
  *-icon-theme \
  fonts-*
# Clean up unused packages
apt-get autoremove -y
apt-get clean
