{ inputs, outputs, lib, config, pkgs, share, ... }:
{
  xdg.configFile = {
    MangoHud.source = ./MangoHud;
    hypr.source = ./hypr;
  };
}
