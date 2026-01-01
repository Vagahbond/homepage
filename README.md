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

### Prepare for release 
As the content is loaded at build time and what's put online is a simple static site, you need to have the db's content when building. 
If building elsewhere than dev machine, DB needs to be exported before with `pgdump`. 


### Production 
Add project as nix flake input.
import the module and enable the package. It will all be built from source by nix.

```nix
{
    services.homepage = {
        enable = true;
    };
}
```




