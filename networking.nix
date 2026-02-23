{ lib, ... }:

{
  networking.hostName = "nixos";
  
  # 1. Disable NetworkManager
  networking.networkmanager.enable = false;

  # 2. Enable iwd
  networking.wireless.iwd.enable = true;

  # 3. Explicitly disable the default wpa_supplicant
  networking.wireless.enable = false;

  # DHCP is still needed to get an IP address from your router
  networking.useDHCP = lib.mkDefault true;

  # VPN
  services.mullvad-vpn.enable = true;
}
