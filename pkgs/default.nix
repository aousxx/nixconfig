final: prev:

{
 dwl= prev.dwl.overrideAttrs (o: {
        src = fetchurl {
          url = "https://codeberg.org/dwl/dwl/archive/v0.5.tar.gz";
          hash = "118183dl844bm2rc2b0cq9v9vfvcn1fn4240vd590id7bg7pwn9j";
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
  thorium-SSE3 = prev.callPackage ./thorium-SSE3.nix {};
  thorium = prev.callPackage ./thorium.nix {};
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}

