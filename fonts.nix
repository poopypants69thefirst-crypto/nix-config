{ pkgs, ... }:

{

  fonts.packages = with pkgs; [
    nerd-fonts.jetbrains-mono
    nerd-fonts.fira-code # Optional: another popular choice
    noto-fonts-color-emoji     # Good for color emojis
  ];

}
