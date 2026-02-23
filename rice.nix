{ pkgs, ... }:

{
  # 1. Enable Hyprland (System-level)
  programs.hyprland.enable = true;

  # Optional: Hint to Electron apps to use Wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";
}
