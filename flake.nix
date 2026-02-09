{
  description = "Homepage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      forAllSystems =
        function:
        nixpkgs.lib.genAttrs
          [
            "x86_64-linux"
            "aarch64-darwin" # Imagine nixing a mac
          ]
          (
            system:
            function (
              import nixpkgs {
                inherit system;
                config.allowUnfree = true;
                config.android_sdk.accept_license = true;
              }
            )
          );
    in
    {
      nixosModules = {
        default =
          {
            lib,
            pkgs,
            config,
            ...
          }:
          (import ./nix/module.nix { inherit lib pkgs config; })
          // (import ./nix/options.nix { inherit lib; });
      };

      devShells = forAllSystems (pkgs: {
        default =
          let
            pgconfigure = pkgs.writeShellScriptBin "pgconfigure" ''
              psql -h localhost -p 5432 -U $USER -d postgres -c "CREATE USER homepage WITH PASSWORD 'password';"
              psql -h localhost -p 5432 -U $USER -d postgres -c "CREATE DATABASE homepage WITH OWNER homepage;";
            '';

            pgstart = pkgs.writeShellScriptBin "pgstart" ''
              pg_ctl -D data -l pglogfile start -o "-k ./";
            '';

            pginit = pkgs.writeShellScriptBin "pginit" ''
              pg_ctl -D data init;
            '';

            pgstop = pkgs.writeShellScriptBin "pgstop" ''
              pg_ctl -D data -l pglogfile stop -o "-k ./";
            '';
          in
          pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs
              pkgs.postgresql
              pgconfigure
              pgstart
              pginit
              pgstop
            ];

            LD_LIBRARY_PATH = "${pkgs.stdenv.cc.cc.lib}/lib";

            shellHook = ''

              echo "pginit init database"
              echo "pgstart start database"
              echo "pgconfigure create db and user"
              echo "pgdump to dump db in database.sql"

              echo Now developping my homepage!
            '';
          };
      });
    };
}
