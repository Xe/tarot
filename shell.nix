let
  pkgs = import <nixpkgs> {};
  sources = import ./nix/sources.nix;
  elm2nix = (import sources.elm2nix { });
in
with pkgs;
pkgs.mkShell {
  buildInputs = [
    pkgs.elmPackages.elm
    pkgs.elmPackages.elm-format
    elm2nix
  ];
}
