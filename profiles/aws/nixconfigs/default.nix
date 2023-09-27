{config, pkgs, lib ,inputs, outputs, ... }:
{
imports = [
   ./theme
   ./nvim
	./zsh
	./kitty
    ./waybar
	./wofi
 ];
}
