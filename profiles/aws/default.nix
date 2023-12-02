{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
  ./configs

  ];
  services.easyeffects.enable = true;


  home.packages = with pkgs; [
   
    ollama
    
   #ttf-icomoon-feather
    xwaylandvideobridgehypr
    wget winetricks wine-staging android-tools  xorg.xhost xdg-desktop-portal-gtk at-spi2-atk 
     
    glib flavours spicetify-cli
    #wpgtk 
    ventoy-full
    nodejs_20 (pkgs.python3.withPackages (ps: with ps; [psutil pipx])) 
    imagemagick kitty lzip zip unzip fzf  gh  git  playerctl  zsh  tldr  autojump  thefuck
    neovim
    vulkan-tools  wine  protonup-qt  lutris  mangohud  gamemode  gamescope

    kitty 

    kdenlive
    
    mimic jellyfin-ffmpeg feh vlc  mpv  syncplay
    
    (wrapOBS { plugins = with obs-studio-plugins; [ obs-backgroundremoval obs-vaapi wlrobs obs-gstreamer obs-vkcapture ]; })
    discord telegram-desktop  signal-desktop 
    go gcc yt-dlp spotify  thorium microsoft-edge  gimp
    heroic
    
    #sound :
    pavucontrol  qpwgraph wireplumber  helvum
    


    #hypr assets : 
    swayidle way-displays  polkit_gnome  cliphist wl-clipboard wtype libsForQt5.dolphin  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    libsForQt5.ark waybar  gnome.gnome-software bemenu  wpa_supplicant    wlr-randr libsForQt5.qt5.qtwayland  mako  swww  connman-gtk  blueberry gparted   

    #wofi
     
    
    flatpak  flatpak-builder
    
    #fonts

    jetbrains-mono  font-awesome  font-awesome_5  font-awesome_4  #nerdfonts
    terminus-nerdfont  inconsolata-nerdfont  nerdfix  fira-code  fira-code-symbols
    
    #LSPs
    gopls nil nodePackages."@tailwindcss/language-server" 
  ];

  



  nixpkgs.config.allowUnfree = true;
    
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.username = "aws";
  home.homeDirectory = "/home/aws";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}
