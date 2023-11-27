final: prev:

{
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  thorium = prev.callPackage ./thorium.nix {};
  ollama = prev.callPackage ./ollama.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}
