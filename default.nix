{ stdenv }:

stdenv.mkDerivation rec {
  name = "asabina-style";
  src = ./.;
  installPhase = ''
    mkdir -p $out && cp -r tex $out
  '';
  pname = name;
  tlType = "run";
}
