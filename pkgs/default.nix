final: prev:

{
(lib.mkIf (config.networking.hostName == "aws-lappy"){
  thorium = prev.callPackage ./thorium-SSE3.nix {};
});
(lib.mkIf (config.networking.hostName == "aws"){
  thorium = prev.callPackage ./thorium.nix {};
});
  xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
  xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
      patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
      ]; });
}
