{
  stdenv
, lib, fetchFromGitLab
, cmake, extra-cmake-modules, pkg-config
, qtbase, qtx11extras, wrapQtAppsHook
, kpipewire, plasma-framework
, xorg
}:

stdenv.mkDerivation rec {
  pname = "xwaylandvideobridge";
  version = "5.27.3";

  src = fetchFromGitLab {
    owner = "davidedmundson";
    repo = "xwaylandvideobridge";
    rev = "b9e0c53570f55f4e8289f72ba78f3945e27e1a1a";
    domain = "invent.kde.org";
    sha256 = "1ypg2c26r5fy9lr8shif5vqcp06yf7mqqj2ps5g00s7s3ykryxdn";
  };

  buildInputs = [ qtbase qtx11extras plasma-framework xorg.xcbproto kpipewire cmake pkg-config ];
  nativeBuildInputs = [ wrapQtAppsHook extra-cmake-modules ]; 
}
