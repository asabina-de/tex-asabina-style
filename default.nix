{ stdenv }:

stdenv.mkDerivation rec {
  texName = "asabina-style";
  name = texName;
  src = ./.;
  installPhase = ''
    mkdir -p $out && cp -r tex $out
  '';
  pname = name;
  tlType = "run";
}
