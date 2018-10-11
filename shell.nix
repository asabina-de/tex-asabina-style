{ system ? builtins.currentSystem }:

let pkgs = import <nixpkgs> {};
in pkgs.callPackage ./env.nix {}
