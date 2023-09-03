{ inputs, outputs, lib, config, pkgs, ... }:
{
  nixpkgs = {
    overlays = [
      outputs.overlays.additions
      outputs.overlays.modifications
    ];
    config = {
      allowUnfree = true;
    };
  };




  nix = {
 
    package = pkgs.nixUnstable;
    extraOptions =
      let empty_registry = builtins.toFile "empty-flake-registry.json" ''{"flakes":[],"version":2}''; in
      ''
        experimental-features = nix-command flakes
        flake-registry = ${empty_registry}
        builders-use-substitutes = true
      '';
    settings.trusted-users = [ "@wheel" "root" ];
    registry.nixpkgs.flake = inputs.nixpkgs;
    nixPath = [ "nixpkgs=${inputs.nixpkgs}" ];
  };




  fonts.packages= with pkgs; [
    #fonts
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override {
      fonts = [ "FiraCode" ];
    })
    font-awesome
    font-awesome_5
    font-awesome_4
    fira-code
    fira-code-symbols
  ];
  



  i18n.defaultLocale = "en_AU.UTF-8";
  time.timeZone = "Europe/Berlin";
  #time.timeZone = "Australia/Brisbane";


  hardware.bluetooth.enable = true;
  services.flatpak.enable = true;

  environment.systemPackages = with pkgs; [
    neovim git kitty vlc tldr thefuck autojump  
  ];


    # Bootloader.
  boot. = {
    loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    supportedFilesystems = [ "ntfs" ];
    kernelModules = [ "v4l2loopback" ];
    extraModulePackages = [ pkgs.linuxPackages.v4l2loopback ];
  }
 


  system.stateVersion = "23.05";
}

    




