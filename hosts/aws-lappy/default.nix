{config, inputs, lib, pkgs, modulesPath,hyprland,stable, ... }:

{
  imports =
    [ 
      ../../pkgs/dependency-hell.nix
      ./hardware.nix
     ];


  environment.binsh = "${pkgs.dash}/bin/dash";
  environment.systemPackages = [
  pkgs.river
    ];
       # Allow unfree packages
  nixpkgs.config = {
  programs.river = {
  enable= true;}; 
  permittedInsecurePackages = [
                "electron-24.8.6"
  ];
  allowUnfree = true;
  allowBroken = true;
  };
  nixpkgs.overlays =[ 
    (import ../../pkgs)


  ];
  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     #extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
     };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
 
 # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  sound.enable = true;
  programs.dconf.enable = true;
  services.pipewire = {
    enable = true;
    audio.enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    jack.enable = true;
  }; 
  
    services.xserver.desktopManager.gnome.enable = true;
    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
    libexecinfo
    stdenv.cc.cc
    zlib
    fuse3
    icu
    zlib
    nss
    openssl
    curl
    expat
    # ...
  ];


  networking.hostName = "aws"; # Define your hostname.

   networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";


  #networking.networkmanager.enable = true;
  hardware.bluetooth.enable = true;
  


  services.connman={enable=true; wifi.backend="wpa_supplicant";};
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  security.sudo.enable = true;
  security.sudo.configFile = '' %wheel ALL=(ALL) ALL '';
  services.zerotierone.enable = true;
  services.zerotierone.joinNetworks = [ "6ab565387a095d4c" ];
  programs.noisetorch.enable =true;
  programs.autojump.enable =true;
  programs.gamemode.enable =true;
  programs.gamescope.enable =true;

  services.xserver = {
       enable = true;
        displayManager.sddm = {
               theme = "${import ../../profiles/aws/configs/nixconfigs/theme/sddm-theme.nix {inherit pkgs;}}"; 
               enable = true;
               };
	}; 





  hardware.opengl = {
	# Mesa
	enable = true;
        extraPackages = [pkgs.mesa.drivers];
      	# Vulkan
	driSupport = true;
  };


  # Bootloader.

  boot = {
    
    loader.grub.enable = true;
    loader.grub.device = "/dev/sda";
    loader.grub.useOSProber = true;
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
    kernelModules = [ "v4l2loopback" ];
    supportedFilesystems = [ "ntfs" ];
    loader.efi.canTouchEfiVariables = true;
  };
 
  nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
  };


  services.printing.enable = true;


  programs.steam = {
  package = pkgs.steam;
  enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.zsh.enable = true; 
  users.users.aws = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = [ "wheel" ];
    packages = with pkgs; [
      wpgtk
    ];
  };

 
 
  system.stateVersion = "23.05"; 

}
