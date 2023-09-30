  #home.file.".gitconfig".source if doesnt work
  # add recursive = true; to each app if it doesnt work too
{ inputs, outputs, lib, config, pkgs, share, ... }:


 let
    link = config.lib.file.mkOutOfStoreSymlink;
 in
{


  imports = [
   ./nixconfigs/theme
   ./nixconfigs/nvim
   ./nixconfigs/zsh
 ];



  xdg.configFile = {
    hypr.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/hypr";
    MangoHud.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/MangoHud";
    kitty.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/kitty";
    waybar.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waybar";
    wofi.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/wofi";
    waydisplay.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waydisplay";
  };
}
