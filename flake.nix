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

      packages = forAllSystems (pkgs: {
        default = pkgs.callPackage ./nix/package.nix { };
      });

      devShells = forAllSystems (pkgs: {
        default =
          let
            inherit (import ./nix/database.nix { inherit pkgs; })
              pgconfigure
              pgstart
              pginit
              pgstop
              pgseed
              ;
          in
          pkgs.mkShell {
            buildInputs = [
              pkgs.nodejs
              pkgs.postgresql
              pgconfigure
              pgstart
              pginit
              pgstop
              pgseed
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
