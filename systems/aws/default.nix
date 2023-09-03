{config, inputs, lib, pkgs, modulesPath, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware.nix
      ../share/common
      ../share/hyprland
      ../share/pipewire
      ../share/locale
      ../share/common
     ];

 

  
  networking.hostName = "aws"; 
  networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";
  

  #enable steam
  programs.steam = {
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };
 
  

  hardware.opengl = {
	# Mesa
	enable = true;

	# Vulkan
	driSupport = true;
  };
 
  # Enable CUPS to print documents.
  services.printing.enable = true;

   

  # services.xserver.libinput.enable = true;
  
  programs.fish.enable = true;
 # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.aws = {
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = [
      "tty"
      "wheel"
      "dialout"
      "networkmanager"
      "libvirtd"
    ];
    shell=pkgs.fish;
  };
  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  discord-canary
  ventoy-full
  vulkan-tools
  gparted
  python311
  python311Packages.pipx
  lzip
  neovim
  git
  oh-my-fish
  waybar
  #hypr assets : 
  (wrapOBS {
      plugins = with obs-studio-plugins; [
        obs-backgroundremoval
	obs-vaapi
        wlrobs
	obs-gstreamer
        obs-vkcapture
      ];
    })
  v4l-utils
  linuxPackages.v4l2loopback
  mpv
  gh
  linux-wifi-hotspot
  blueberry
  wpa_supplicant
  swww
  libsForQt5.qt5.qtwayland
  qt6.qtwayland
  flatpak
  flatpak-builder
  gnome.gnome-software
  cliphist
  fzf
  playerctl
  wine
  wine64
  winetricks
  inputs.hyprland-contrib.packages.${pkgs.system}.grimblast 
  wtype
  firefox
  gimp
    signal-desktop 
    telegram-desktop
    gamemode
    gamescope
    ffmpeg
    syncplay
    telegram-desktop
    microsoft-edge
    protonup-qt
    lutris     
    mangohud
    gimp
    spotify
  ];

}
