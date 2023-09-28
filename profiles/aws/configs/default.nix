  #home.file.".gitconfig".source if doesnt work
  # add recursive = true; to each app if it doesnt work too
{ inputs, outputs, lib, config, pkgs, share, ... }:


 let
    link = config.lib.file.mkOutOfStoreSymlink;
 in
{
  home.file.".config".source = link ./.config;

  
  #xdg.configFile = {
  #    MangoHud.source = ./MangoHud;
  #    hypr.source = ./hypr;
  #};
}
