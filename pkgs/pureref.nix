{ pkgs, fetchurl }:

let
  pname = "pureref";
  version = "1.11.1";

  src = ./PureRef-1.11.1_x64.Appimage;

in

pkgs.runCommand "pureref" {
  buildInputs = with pkgs; [ appimage-run ];
} ''
  mkdir -p $out/bin

  cat <<-EOF > $out/bin/pureref
  #!/bin/sh
  ${pkgs.appimage-run}/bin/appimage-run ${src}
  EOF

  chmod +x $out/bin/pureref
''
