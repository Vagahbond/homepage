{
  description = "Homepage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs = {nixpkgs, ...}: let
    system = "x86_64-linux";
    pkgs = nixpkgs.legacyPackages.${system};
  in {
    nixosModules = {
      default = {
        lib,
        pkgs,
        config,
        ...
      }:
        (import ./nix/module.nix {inherit lib pkgs config;})
        // (import ./nix/options.nix {inherit lib;});
    };
    devShells.${system} = {
      default = pkgs.mkShell {
        buildInputs = [pkgs.bun];
        shellHook = ''
          echo Now developping my homepage!
        '';
      };
    };
  };
}
