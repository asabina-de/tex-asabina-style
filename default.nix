{ stdenv }:

stdenv.mkDerivation rec {
  texName = "asabina-style";
  name = texName;
  src = ./.;
  installPhase = ''
    mkdir -p $out/tex/latex/${texName}
    cp src/*.sty $out/tex/latex/${texName}/.
  '';
  pname = name;
  tlType = "run";
}
