# Home page 
My personal branding home page.

## Dev

### Dev env 

```bash 
# load environment and dependencies
nix develop

# install nodejs packages
npm i 

# Initialize a PG instance (from root of project)
pginit

# Start DB 
pgstart

# Create user and DB
pgconfigure

# Run backend ...
cd backend
npm run dev 

# ...or frontend 
npm run dev

```

Change content at `localhost:3000` and inspect changes at `localhost:5173`

### Language URLs

English content is prerendered at `/`, `/about`, `/projects`, and `/experience`.
French equivalents use `/fr`, `/fr/about`, `/fr/projects`, and `/fr/experience`.
The homepage never redirects based on browser language or cookies; visitors choose
through the language selector. Every page has a self-canonical URL and reciprocal
English/French `hreflang` links, with its English version as `x-default`.

Legacy `/en` URLs generate redirect documents for static hosting. For permanent
HTTP redirects in production, add this location to your existing Nginx virtual host:

```nix
locations."~ ^/en(?:/(.*))?$".return = "308 /$1$is_args$args";
```

The homepage loader normalizes legacy CMS navigation links automatically, so the
existing content snapshot does not require changes.

### Prepare for release 
As the content is loaded at build time and what's put online is a simple static site, you need to have the db's content when building. 
If building elsewhere than dev machine, DB needs to be exported before with `pgdump`. 


### Production

Add this project as a flake input, then override the package's `siteOrigin` from your
configuration. Serve the resulting static package with your existing web server.
No NixOS module is provided or required.

```nix
{ inputs, pkgs, config, ... }:
let
  homepage = inputs.homepage.packages.${pkgs.stdenv.hostPlatform.system}.default.override {
    siteOrigin = config.services.homepage.siteOrigin;
  };
in
{
  services.nginx.virtualHosts.${config.networking.hostName}.root = homepage;
}
```

The `config.services.homepage.siteOrigin` option above belongs to your consuming
configuration; replace it with whichever option holds your public HTTP(S) origin.
Nix passes `siteOrigin` as `PUBLIC_SITE_ORIGIN` during the build, baking it into
canonical URLs, language alternates, and the prerender configuration.

For a non-Nix build, set the same variable in the build environment or root `.env`:

```bash
PUBLIC_SITE_ORIGIN="$SITE_ORIGIN" npm run build
```

Use an absolute HTTP(S) origin without a path, credentials, query, or fragment.
Production builds fail if it is missing or invalid. Development and type checking
default to the local Vite origin when it is unset. Changing the origin requires a rebuild.




