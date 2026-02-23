# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
      ./networking.nix
      ./gpu.nix
      ./flatpak.nix
      ./fonts.nix  
      ./rice.nix
#      ./core.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

services.greetd = {
      enable = true;
      settings = {
         default_session = {
            command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd hyprland";
            user = "greeter";
      };
   };
};

  services.openssh = {
    enable = true;
    allowSFTP = true;
  };


  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  hardware.bluetooth.enable = true;

  hardware.bluetooth.powerOnBoot = true;

  services.blueman.enable = true;


  # Use latest kernel.
  boot.kernelPackages = pkgs.linuxPackages_lqx;

  # Set your time zone.
  time.timeZone = "Africa/Cairo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "ar_EG.UTF-8";
    LC_IDENTIFICATION = "ar_EG.UTF-8";
    LC_MEASUREMENT = "ar_EG.UTF-8";
    LC_MONETARY = "ar_EG.UTF-8";
    LC_NAME = "ar_EG.UTF-8";
    LC_NUMERIC = "ar_EG.UTF-8";
    LC_PAPER = "ar_EG.UTF-8";
    LC_TELEPHONE = "ar_EG.UTF-8";
    LC_TIME = "ar_EG.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,ara";
    variant = "";
  };

security.doas.enable = true;
security.sudo.enable = false; # Optional: kill sudo entirely

security.doas.extraRules = [{
  users = [ "chi" ];
  keepEnv = true;  # Recommended: keeps your PATH and environment
  persist = true;  # Optional: don't ask for password again for a few mins
}];


environment.systemPackages = with pkgs; [
      bluetuith
      git
      swayfx
      swaybg
      neofetch
      foot
      tuigreet
      pcmanfm
      iwd
      git
      rofi
      vim
      steam
      firefox
      btop
      brightnessctl
      flatpak
      mullvad-vpn
      wl-clipboard
      cliphist
      xarchiver
      vesktop
      grim
      slurp
      quickshell
      hyprshot
      kdePackages.qt5compat 
      kdePackages.qtsvg
];




  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.chi = {
    isNormalUser = true;
    description = "chi";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;


  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.11"; # Did you read the comment?

}
