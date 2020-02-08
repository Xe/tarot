{ system ? builtins.currentSystem }:

let
  pkgs = import <nixpkgs> { inherit system; };
  sources = import ./nix/sources.nix;
  quickserv = import sources.quickserv { };
  callPackage = pkgs.lib.callPackageWith pkgs;
  tarot = import ./default.nix { };

  dockerImage = pkg:
    pkgs.dockerTools.buildImage {
      name = "xena/tarot";
      tag = pkg.version;

      contents = [ pkg quickserv ];

      config = {
        Cmd = [ "/bin/quickserv" ];
        WorkingDir = "/public";
      };
    };

in dockerImage tarot
