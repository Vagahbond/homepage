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

  nativeBuildInputs = with db; [
    pkgs.postgresql
    pgconfigure
    pgstart
    pginit
    pgstop
    pgseed
  ];

  buildPhase = ''
    export DATABASE_URI="pg://homepage:homepage@/homepage?host=$(pwd)/data";

    pginit 

    pgstart

    pgconfigure

    pgseed

    npm --workspace backend run dev &

    npm run build

    kill %1

    mkdir -p $out
    cp -r ./build/* $out
  '';

  packageJSON = ../package.json;
  packageLock = ../package-lock.json;
  npmDepsHash = "sha256-2v6mFV1dezllg+sh9x8oDgzYV3UL/TajFLAz+aD9Gfs=";
}
