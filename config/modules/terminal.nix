{ pkgs, ... }:

{
	environment.systemPackages = with pkgs; [ 
		foot
		vim
		fastfetch
		starship
		btop
		yazi
		brightnessctl
                zsh
                zsh-autocomplete
                zsh-autosuggestions
                zsh-nix-shell
                zsh-syntax-highlighting

	];
}
