{
  description = "Homepage";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";
  };

  outputs =
    { nixpkgs, ... }:
    let
      system = "x86_64-linux";
      pkgs = nixpkgs.legacyPackages.${system};
      configure = ''
        psql -h localhost -p 5432 -U $USER -d postgres -c "CREATE ROLE homepage WITH LOGIN CREATEDB REPLICATION;"
        psql -h localhost -p 5432 -U $USER -d postgres -c "CREATE USER homepage WITH PASSWORD 'password';"
        psql -h localhost -p 5432 -U $USER -d postgres -c "GRANT homepage TO homepage;"
        psql -h localhost -p 5432 -U $USER -d postgres -c "CREATE DATABASE homepage WITH OWNER homepage;";
      '';
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
      devShells.${system} = {
        default = pkgs.mkShell {
          buildInputs = [
            pkgs.nodejs
            pkgs.postgresql
          ];
          shellHook = ''
            alias pginit='pg_ctl -D data init;';
            alias pgstart='pg_ctl -D data -l pglogfile start -o "-k ./"; ';
            alias pgconfigure=${pkgs.writeScript "pgconfigure" configure};
            alias pgdump='pg_dump -d homepage -U homepage -h localhost -p 5432 -f database.sql'

            echo "pginit init database"
            echo "pgstart start database"
            echo "pgconfigure create db and user"
            echo "pgdump to dump db in database.sql"

            export LD_LIBRARY_PATH="${pkgs.stdenv.cc.cc.lib}/lib";


            echo Now developping my homepage!
          '';
        };
      };
    };
}
