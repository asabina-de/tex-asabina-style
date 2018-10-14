with import <nixpkgs> {};

let
  fonts = makeFontsConf { fontDirectories = [ montserrat ]; };
in stdenv.mkDerivation rec {
  name = "tex-asabina-style-env";
  buildInputs = [
    gnumake
    (texlive.combine {
      inherit (texlive)
      scheme-basic

      collection-fontsrecommended
      collection-langgerman
      collection-latexrecommended
      lastpage
      metafont
      numprint
      xetex
      xstring
      ;
    })
  ];

  FONTCONFIG_FILE = fonts;

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
