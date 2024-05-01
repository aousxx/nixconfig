  #home.file.".gitconfig".source if doesnt work
  # add recursive = true; to each app if it doesnt work too
{ inputs, outputs, lib, config, pkgs, share, ... }:


 let
    link = config.lib.file.mkOutOfStoreSymlink;
 in
{


  imports = [
   ./nixconfigs/theme
   ./nixconfigs/lf
   ./nixconfigs/zsh
 ];



  #Tela.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/icons .local/share/icons"
  xdg.dataFile = {
  };

  xdg.configFile = {
    yambar.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/yambar";
  #  lf.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/lf";
  #  wpg.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/wpg";
    MangoHud.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/MangoHud";
    river.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/river";
    hypr.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/hypr";
    nvim.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/nvim";
    kitty.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/kitty";
    waybar.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waybar";
    wofi.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/wofi";
    waydisplay.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waydisplay";
   # beautifuldiscord.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/beautifuldiscord";
   # flavours.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/flavours";
    mpv.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/mpv";
  };
}
