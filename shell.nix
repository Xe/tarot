let
  pkgs = import <nixpkgs> {};
  sources = import ./nix/sources.nix;
  elm2nix = (import sources.elm2nix { });
in
with pkgs;
with elmPackages;
pkgs.mkShell {
  buildInputs = [
    elm
    elm-format
    elm2nix
    nix
    cacert
  ];
}
