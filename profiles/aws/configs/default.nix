  #home.file.".gitconfig".source if doesnt work
  # add recursive = true; to each app if it doesnt work too
{ inputs, outputs, lib, config, pkgs, share, ... }:


 let
    link = config.lib.file.mkOutOfStoreSymlink;
 in
{


  imports = [
   ./nixconfig/theme
   ./nixconfig/nvim
   ./nixconfig/zsh
 ];


  home.file.".config/hypr".source = link ./.config/hypr;
  home.file.".config/MangoHud".source = link ./.config/MangoHud;
  home.file.".config/kitty".source = link ./.config/kitty;
  home.file.".config/waybar".source = link ./.config/waybar;
  home.file.".config/wofi".source = link ./.config/wofi;
  home.file.".config/waydisplay".source = link ./.config/waydisplay;

  #xdg.configFile = {
  #    MangoHud.source = ./MangoHud;
  #    hypr.source = ./hypr;
  #};
}
