final: prev:

{
 dwl= prev.dwl.overrideAttrs (o: {
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

