{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
  ./configs

  ];
  services.easyeffects.enable = true;
   services.spotifyd = {
   enable = true;
   settings =
     {
       global = {
         username = "aws.abdulrahman@protonmail.com";
         password = ",cqQ$9W/gCn8=2i";
       };
     };
  };

  home.packages = with pkgs; 
  let 
    pureref = pkgs.callPackage (import ../../pkgs/pureref.nix) {}; 

  in 

  [
    nix-direnv

    jmtpfs
    
    # whisper-ctranslate2
    
    unstable.llama-cpp ollama
    rocmPackages.rocminfo     pciutils
    qemu 
    virtiofsd
    temurin-jre-bin-18
    
    pureref
    bottles  heroic vulkan-tools  wine  protonup-qt  lutris  mangohud  gamemode
    connman-gtk
    winetricks wine-staging android-tools  xorg.xhost xdg-desktop-portal-gtk at-spi2-atk 
    file
    xwaylandvideobridgehypr


     
    android-tools
    usbutils
    pdfarranger 
    flavours 
    
    ventoy-full
    
    
    neovim zellij kitty 
    ntfs3g lf imagemagick fzf  gh  git-lfs git  playerctl  zsh  tldr  autojump  thefuck


    godot_4 aseprite-unfree kdenlive mpvpaper jellyfin-ffmpeg feh vlc  mpv  syncplay
    
    (wrapOBS { plugins = with obs-studio-plugins; [droidcam-obs obs-backgroundremoval obs-vaapi wlrobs obs-gstreamer obs-vkcapture ]; })
    

    discord telegram-desktop  signal-desktop 

    nodejs_20 (pkgs.python3.withPackages (ps: with ps; [virtualenv psutil pipx])) 
    go gcc glib wget  
    tailwindcss


    samba4Full
    ueberzugpp
    piper-tts
    wf-recorder slurp yt-dlp spotify-tui 

    thorium krita gimp
    
    
    #sound :
    pavucontrol  qpwgraph wireplumber  helvum

    #hypr assets : 
    libsForQt5.kio-extras libsForQt5.kdegraphics-thumbnailers
    swayidle way-displays  polkit_gnome  cliphist wl-clipboard wtype libsForQt5.dolphin  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast
    libsForQt5.ark waybar  gnome.gnome-software bemenu  wpa_supplicant    wlr-randr libsForQt5.qt5.qtwayland  mako  swww  networkmanagerapplet  blueberry gparted   
 
    flatpak  flatpak-builder
    
    #fonts
    jetbrains-mono  font-awesome  font-awesome_5  font-awesome_4  #nerdfonts
    terminus-nerdfont  inconsolata-nerdfont  nerdfix  fira-code  fira-code-symbols
    
    air
    #LSPs
    #gopls nil nodePackages."@tailwindcss/language-server" 
     
    #atool depends
    atool zip unzip xz unrar p7zip gzip
  ];

  



  nixpkgs.config.allowUnfree = true;
    
  programs.git.enable = true;
  programs.home-manager.enable = true;
  home.username = "aws";
  home.homeDirectory = "/home/aws";
  systemd.user.startServices = "sd-switch";
  home.stateVersion = "23.05";
}
