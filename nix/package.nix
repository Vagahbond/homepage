{
  pkgs,
  lib,
  buildNpmPackage,
}:
let
  db = import ./database.nix { inherit pkgs; };

in
buildNpmPackage {
  name = "homepage";
  src = ../.;
  # Does not matter as Payload is only ran durign build
  PAYLOAD_SECRET = "YOUR_SECRET_HERE";
  DATABASE_URI = "pg://homepage:homepage@localhost:5432/homepage";

  nativeBuildInputs = with db; [
    pkgs.postgresql
    pgconfigure
    pgstart
    pginit
    pgstop
    pgseed
  ];

  buildPhase = ''
    pginit
    pgstart
    pgconfigure
    pgseed

    npm --workspace backend run dev &

    npm run build

    kill %1

    mkdir -p $out
    cp -r ./.svelte-kit/output/prerendered/pages/* $out
  '';

  packageJSON = ../package.json;
  packageLock = ../package-lock.json;
  npmDepsHash = "sha256-VduqM27MAgEQEPpKCByOqTabuowyNLpNiKAYd5CmJBE=";
}
