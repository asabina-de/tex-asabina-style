with import <nixpkgs> {};

let
  fonts = makeFontsConf { fontDirectories = [ montserrat ]; };
  style = callPackage ./default.nix {};
in stdenv.mkDerivation rec {
  name = "${style.name}-env";
  version = "0.1.0";
  buildInputs = [
    gnumake
    (texlive.combine {
      inherit (texlive)
      scheme-basic

      collection-fontsrecommended
      collection-langgerman
      collection-latexrecommended
      metafont
      numprint
      xetex
      xstring
      ;

      style = {
        pkgs = [ style ];
      };
    })
  ];

  FONTCONFIG_FILE = fonts;

  shellHook = ''
    # https://github.com/NixOS/nix/issues/1056
    export TERMINFO=/run/current-system/sw/share/terminfo
    real_TERM=$TERM; TERM=xterm; TERM=$real_TERM; unset real_TERM
  '';
}
