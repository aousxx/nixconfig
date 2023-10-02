final: prev:

{
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}
