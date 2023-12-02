{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
  
  ./configs

  ];

  home.packages = with pkgs; [
    
   #ttf-icomoon-feather
    wget winetricks wine-staging xdg-desktop-portal-gtk at-spi2-atk 
     
    mesa-demos gcc glib flavours
    #wpgtk 
     (pkgs.python3.withPackages (ps: with ps; [psutil pipx])) 
    imagemagick kitty lzip zip unzip fzf  gh  git  playerctl  zsh  tldr  autojump  thefuck
    
    vulkan-tools  wine  protonup-qt  lutris  mangohud  gamemode  gamescope
    neovim
    kitty 
    
    feh  mpv  syncplay
    
    discord telegram-desktop  signal-desktop 
    yt-dlp spotify thorium
    
    #sound :
    pavucontrol
    


    #hypr assets : 
    swayidle way-displays  polkit_gnome  cliphist wl-clipboard wtype libsForQt5.dolphin  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    libsForQt5.ark waybar  gnome.gnome-software bemenu  wpa_supplicant    wlr-randr libsForQt5.qt5.qtwayland  mako  swww  connman-gtk  blueberry gparted   

    #wofi
     
    
    flatpak
    
    #fonts

    jetbrains-mono  font-awesome  font-awesome_5  font-awesome_4  #nerdfonts
    terminus-nerdfont  inconsolata-nerdfont  nerdfix  fira-code  fira-code-symbols
  ];

  



  nixpkgs.config.allowUnfree = true;
    
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.username = "aws";
  home.homeDirectory = "/home/aws";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}
