{ config, pkgs ,fetchgit, ... }:
{
  nixpkgs.overlays = [
    (self: super: {
      yambar = super.yambar.overrideAttrs (oldAttrs: rec {
        src = fetchgit {
           url = "https://codeberg.org/dnkl/yambar";
           hash= "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa";
        };
      });
     dwl = super.dwl.overrideAttrs (oldAttrs: rec {
        src = fetchgit {
            url = "https://codeberg.org/dwl/dwl";
           hash= "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAa";
        };
        patches = [
          ./dwl-patches/focusdirection.patch
          ./dwl-patches/attachbottom.patch
          ./dwl-patches/monfig.patch
          ./dwl-patches/point.patch
          ./dwl-patches/restoreTiling.patch
          ./dwl-patches/toggleKbLayout.patch
          ./dwl-patches/cursor_warp.patch
          ./dwl-patches/output-power-management.patch
          ./dwl-patches/autostart.patch
          ./dwl-patches/vanitygaps.patch
        ];
      });
    })
  ];
}
