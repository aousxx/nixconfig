{ inputs, outputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.hyprland.nixosModules.default
  ];

  environment.systemPackages = with pkgs; [
    pavucontrol
    qjackctl
    bemenu
    xorg.xhost
    way-displays
    cinnamon.nemo-with-extensions
    cinnamon.nemo-fileroller
    xdg-desktop-portal-hyprland
    blueberry
    connman-gtk
  ];.

  programs.hyprland.enable = true;

  services.xserver = {
       enable = true;
       displayManager.gdm = {
               enable = true;
               wayland = true;
               };
	}; 
  
  services.connman = {enable=true; wifi.backend="wpa_supplicant";};

  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
    ];
  };

  security = {
    rtkit.enable = true;
    polkit.enable = true;
    pam.services.swaylock = {};
  };
}
