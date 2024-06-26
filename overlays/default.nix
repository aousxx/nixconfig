{ inputs,  pkgs ,... }:
{
  # This one brings our custom packages from the 'pkgs' directory
  #additions = final: _prev: import ../pkgs { pkgs = final; };
  ttf-icomoon-feather =  pkgs.callPackage ../pkgs/ttf-icomoon-feather.nix { };
  qemu = pkgs.unstable.qemu.override { smbdSupport = true; };
  llama-cpp = pkgs.unstable.llama-cpp.override{rocmSupport = true; };
  steam = pkgs.steam.override {
      extraPkgs = pkgs: with pkgs; [
        xorg.libXcursor
        xorg.libXi
        xorg.libXinerama
        xorg.libXScrnSaver
        libpng
        libpulseaudio
        libvorbis
        stdenv.cc.cc.lib
        libkrb5
        keyutils
      ];
    };

unstable = import inputs.nixpkgs-unstable {
      system = final.system;
      config.allowUnfree = true;
  # This one contains whatever you want to overlay
  # You can change versions, add patches, set compilation flags, anything really.
  # https://nixos.wiki/wiki/Overlays
  modifications = final: prev: {};
}
