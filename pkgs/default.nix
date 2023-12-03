final: prev:

{
  thorium-SSE3 = prev.callPackage ./thorium-SSE3.nix {};
  thorium = prev.callPackage ./thorium.nix {};
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}

