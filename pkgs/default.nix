  final: prev: { 
  llama-cpp = prev.llama-cpp.override{rocmSupport = true; openblasSupport = false;};
    steam = prev.steam.override {
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

    thorium-SSE3 = prev.callPackage ./thorium-SSE3.nix {};
    thorium = prev.callPackage ./thorium.nix {};
    xwaylandvideobridge = prev.libsForQt5.callPackage ./xwaylandvideobridge.nix {};
    xwaylandvideobridgehypr = final.xwaylandvideobridge.overrideAttrs (o: {
        patches = (o.patches or [ ]) ++ [
        ./xwaylandvideobridge.patch
        ]; });
  }

