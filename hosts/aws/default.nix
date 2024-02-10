{config, inputs,outputs,  lib, pkgs, modulesPath, ... }:

{
  imports =
    [ 
      
      ../../pkgs/dependency-hell.nix
      ./virtualization.nix
      ./pipewire.nix
      ./hardware.nix
     ];


  environment.binsh = "${pkgs.dash}/bin/dash";
  services.devmon.enable = true;
  services.gvfs.enable = true;
  services.udisks2.enable = true;
  #systemd.tmpfiles.rules = [
  #  "L+    /opt/rocm/hip   -    -    -     -    ${pkgs.rocmPackages.clr}"
  #];



       # Allow unfree packages
  nixpkgs.config = {
  
  permittedInsecurePackages = [
                "xpdf-4.04"
                "electron-24.8.6"
  ];
  allowUnfree = true;
  allowBroken = true;
  };

  nixpkgs.overlays = [ 
  (import ../../pkgs) 
  (final: _prev: {
    unstable = import inputs.stable {
      system = "x86_64-linux";
    };
  })
  ];


  services.flatpak.enable = true;
  xdg.portal = {
     enable = true;
     extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
     };
  # Set your time zone.
  time.timeZone = "Europe/Berlin";
 
 # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
 
  virtualisation.waydroid.enable = true;
    security.pam.loginLimits = [
    { domain = "@audio"; item = "memlock"; type = "-"; value = "unlimited"; }
    { domain = "@audio"; item = "rtprio"; type = "-"; value = "99"; }
    { domain = "@audio"; item = "nofile"; type = "soft"; value = "1048576"; }
    { domain = "@audio"; item = "nofile"; type = "hard"; value = "1048576"; }
  ];


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

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
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
  hardware={ bluetooth.enable = true;
  opengl.extraPackages = with pkgs; [rocmPackages.clr.icd];
  pulseaudio.enable = false;
};
  


  services.connman={enable=true; wifi.backend="wpa_supplicant";};
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

	# Vulkan
	driSupport = true;
  };



  boot = {
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
    kernelModules = [ "v4l2loopback" ];
    supportedFilesystems = [ "ntfs" ];
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
  };
 
  nix.settings = {
      experimental-features = [ "nix-command" "flakes" ];
      substituters = ["https://hyprland.cachix.org" "https://ai.cachix.org"];
      trusted-public-keys = ["ai.cachix.org-1:N9dzRK+alWwoKXQlnn0H6aUx0lU/mspIoz8hMvGvbbc=" "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc="];
  };


  services.printing.enable = true;
  programs.hyprland.enable = true;

  programs.steam = {
  #package = pkgs.steam;
  enable = true;
  gamescopeSession.enable = true;
  remotePlay.openFirewall = true; # Open ports in the firewall for Steam Remote Play
  dedicatedServer.openFirewall = true; # Open ports in the firewall for Source Dedicated Server
  };

  programs.zsh.enable = true; 
  users.users.aws = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "aws abdulrahman";
    extraGroups = ["audio" "docker" "users" "wheel" "libvirtd" ];
    packages = with pkgs; [
      rocmPackages.rocm-runtime 
      wpgtk
    ];
  };

 
 
  system.stateVersion = "23.05"; 

}
