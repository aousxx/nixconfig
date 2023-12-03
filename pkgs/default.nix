final: prev:

{
 dwl= prev.dwl.overrideAttrs (o: {
        src = final.fetchurl {
          url = "https://codeberg.org/dwl/dwl/archive/v0.5.tar.gz";
          hash = "sha256-Mll+z1unRZBK24AIYl2wbLuddsIMLMGyqIsQRNtAAYU=";
        };
        patches = [
       #   ./dwl-patches/focusdirection.patch
       #   ./dwl-patches/attachbottom.patch
       #   ./dwl-patches/monfig.patch
       #   ./dwl-patches/point.patch
       #   ./dwl-patches/restoreTiling.patch
       #   ./dwl-patches/toggleKbLayout.patch
       #   ./dwl-patches/cursor_warp.patch
       #   ./dwl-patches/output-power-management.patch
       #   ./dwl-patches/autostart.patch
       #   ./dwl-patches/vanitygaps.patch
        ];
        });
  thorium-SSE3 = prev.callPackage ./thorium-SSE3.nix {};
  thorium = prev.callPackage ./thorium.nix {};
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}

