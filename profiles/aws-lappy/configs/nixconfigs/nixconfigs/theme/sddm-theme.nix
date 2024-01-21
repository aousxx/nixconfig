 { pkgs }:

let
  imgLink = "https://images.hdqwalls.com/download/anime-girl-on-skateboard-scifi-oc-1680x1050.jpg";

  image = pkgs.fetchurl {
    url = imgLink;
    sha256 = "1l2zkxjn4f1qgyz2qwxnmw1ws461x9r9rvf5lrhwsbavwi0260v8";
  };
in
pkgs.stdenv.mkDerivation {
  name = "sddm-theme";
  src = pkgs.fetchFromGitHub {
    owner = "MarianArlt";
    repo = "sddm-sugar-dark";
    rev = "ceb2c455663429be03ba62d9f898c571650ef7fe";
    sha256 = "0153z1kylbhc9d12nxy9vpn0spxgrhgy36wy37pk6ysq7akaqlvy";
  };

  installPhase = ''
    mkdir -p $out
    cp -R ./* $out/
    cd $out/
    rm Background.jpg
    cp -r ${image} $out/Background.jpg
   '';
}
