{ config, pkgs, lib, ... }: # This is your existing top line

{
  # ... ALL your existing settings (boot, networking, etc) are here ...

  # Move the Flatpak/XDG settings INSIDE this block:
  services.flatpak.enable = true;

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [ 
      xdg-desktop-portal-wlr 
      xdg-desktop-portal-gtk 
    ];
    config.common.default = "*"; 
  };

} # Only ONE closing brace at the very end of the file
