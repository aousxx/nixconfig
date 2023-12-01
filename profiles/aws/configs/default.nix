  #home.file.".gitconfig".source if doesnt work
  # add recursive = true; to each app if it doesnt work too
{ inputs, outputs, lib, config, pkgs, share, ... }:


 let
    link = config.lib.file.mkOutOfStoreSymlink;
 in
{


  imports = [
   ./nixconfigs/theme
   #./nixconfigs/nvim
   ./nixconfigs/zsh
   ./nixconfigs/tmux
 ];



  #Tela.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/icons .local/share/icons"
  xdg.dataFile = {
  };

  xdg.configFile = {
    hypr.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/hypr";
    MangoHud.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/MangoHud";
    nvim.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/nvim";
    kitty.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/kitty";
    waybar.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waybar";
    wofi.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/wofi";
    waydisplay.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/waydisplay";
    beautifuldiscord.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/beautifuldiscord";
    flavours.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/flavours";
    mpv.source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/mpv";
    "discord/settings.json".source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/discord/settings.json";
    "wpg/wpg.conf".source = link "${config.home.homeDirectory}/.dotfiles/profiles/aws/configs/.config/wpg/wpg.conf";
  };
}
