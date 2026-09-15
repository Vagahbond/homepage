# AGENTS.md

Personal branding homepage. SvelteKit static frontend + Payload CMS backend, backed by PostgreSQL. The frontend is fully prerendered at **build time** from CMS content; there is no runtime API call in production.

## Architecture

- **`src/`** — SvelteKit frontend (Svelte 5). Builds to a static site via `@sveltejs/adapter-static`.
- **`backend/`** — Payload CMS 3 app (Next.js 15 + Postgres adapter). Runs standalone as the CMS admin/API server during development (`localhost:3000`).
- Frontend does **not** call the backend over HTTP. Instead `src/lib/utils/payload.ts` imports `backend/src/payload.config.ts` directly and calls `getPayload()` in-process (see `PayloadHandle` singleton). `+page.server.ts` files call `payloadHandle.getInstance()` and use `payload.findGlobal(...)` / collection queries directly against Postgres.
- Because of this, the frontend has a **build-time dependency on a live, seeded Postgres database**. You cannot `vite build` without the DB running and populated — content is baked into the static output.
- `backend/src/payload.config.ts` defines collections (`Users`, `Media`, `Project`, `Experience`) and globals (`HomePageData`, `ProjectsPageData`, `ContactPageData`, `ExperiencesPageData`). Payload auto-generates TypeScript types to `src/lib/payload-types.ts` (do not hand-edit; regenerate via backend's `generate:types`).
- Localization: `SupportedLanguages = ["fr", "en"]` (exported from `src/lib/utils/payload.ts`); Payload's own locales config lives in `payload.config.ts` (`defaultLocale: "en"`, locales `["en", "fr"]`). Routes are under `src/routes/[lang]/...`; the root `+page.server.ts` at `[lang]` level redirects unsupported langs to `/`.
- `vite.config.ts` explicitly excludes the `data` directory (Postgres data dir) from Vite's watcher/optimizer and marks `backend/src/icons.ts` as an allowed fs path — these are project-specific workarounds, don't remove without checking why.
- `nix/` contains the Nix package/dev-shell definitions; `nix/database.nix` defines the Postgres helper commands used in dev (see below). `flake.nix` exposes both a `devShell` and a buildable `package` (for deploying via NixOS module, per README).

## Environment setup & commands

This project assumes a **Nix dev shell** (`nix develop`) providing `nodejs`, `postgresql`, and custom Postgres helper scripts. Do not use `brew`/`apt`/`nix-env` — use `nix develop`, `nix-shell -p ...`, or `nix run nixpkgs#...` if a tool is missing.

Postgres helper commands (from `nix/database.nix`, run from project root — they assume a `data/` dir there):
```bash
pginit       # pg_ctl -D data init
pgstart      # pg_ctl -D data -l pglogfile start -o "-k ./"
pgconfigure  # creates `homepage` user/db (password: password)
pgseed       # loads database.sql into the `homepage` db
pgstop       # stop the postgres instance
pgdump       # dumps current db content to database.sql (needed before building elsewhere)
```

Frontend (root `package.json`, uses `npm`/`bun` — `bun.lock` present):
```bash
npm run dev          # vite dev, served at localhost:5173
npm run build        # vite build — REQUIRES live seeded DB (see above)
npm run preview       # preview built static site
npm run check         # svelte-kit sync && svelte-check
npm run lint          # prettier --check . && eslint .
npm run format        # prettier --write .
```

Husky is set up via the root `prepare` script (`husky && (svelte-kit sync || echo '')`), which runs automatically on `npm i`. It installs a `pre-commit` hook that dumps the dev Postgres content to `database.sql` and stages it (see Gotchas below).

Backend (`backend/`, uses `pnpm`, Next.js/Payload):
```bash
cd backend
npm run dev              # next dev, Payload admin at localhost:3000
npm run generate:types   # regenerate src/lib/payload-types.ts after schema changes
npm run generate:importmap
npm run lint             # next lint
npm run test             # test:int (vitest) then test:e2e (playwright)
npm run test:int         # vitest run --config ./vitest.config.mts
npm run test:e2e         # playwright test
```

Typical fresh dev workflow (from README): `nix develop` → `npm i` → `pginit` → `pgstart` → `pgconfigure` → (`pgseed` if restoring content) → run backend (`cd backend && npm run dev`) and frontend (`npm run dev`) concurrently. Edit content at `localhost:3000` (Payload admin), see it reflected at `localhost:5173` (SvelteKit dev).

## Code conventions

- Formatting is enforced by Prettier: **tabs**, single quotes, no trailing commas, printWidth 100 (`.prettierrc`). `backend/` has its own separate `.prettierrc.json`/eslint config — don't assume root config applies there.
- ESLint (root) is flat-config based (`eslint.config.js`), built on `typescript-eslint` + `eslint-plugin-svelte`, with `no-undef` disabled (standard for TS projects). `.svelte`, `.svelte.ts`, `.svelte.js` files get the Svelte-aware TS parser config.
- Icons live as individual Svelte components in `src/lib/icons/` (one file per icon, e.g. `github.svelte`, `mail.svelte`) rather than a single icon-sprite/library.
- Path alias: `$lib` → `src/lib` (SvelteKit default); `@/*` mapped to project root in `package.json`/tsconfig for other imports (e.g. `backend/src/payload.config.ts` imported from frontend code).
- `src/lib/utils/` holds cross-cutting helpers: `payload.ts` (CMS access singleton + language list), `nav.ts`, `media.ts`, `colors.ts`, `glitch.ts`, `destroy.ts` — check these before adding new util logic, especially anything related to visual "glitch"/CRT effects (`crt.css`, `effects.css` at `src/`) which are a recurring theme feature of this site (see recent commits like "graphic glitches: fix", "auto-destruct message").

## Gotchas

- **`database.sql` is the actual content source for builds**: `npm run build` reads live from Postgres, and that Postgres instance is seeded from the root-level `database.sql` dump via `pgseed`. Anyone (or any CI/build machine) building elsewhere must `pgseed` from this file first — without an up-to-date `database.sql`, the build either fails or produces stale content. Treat `database.sql` as a checked-in content snapshot, not disposable SQL boilerplate.
- **Auto-refreshed on commit**: a Husky `pre-commit` hook (`.husky/pre-commit`) runs `pgdump` and `git add database.sql` automatically before every commit, so content edited in the Payload admin gets captured without a manual step. If `pgdump` isn't on `PATH` (not in the Nix dev shell) or the dev Postgres isn't running (`pgstart`), the hook just warns and lets the commit through with a possibly stale `database.sql` — it does not block commits.
- **Static site + CMS coupling**: any change requiring new/updated content must exist in the seeded DB before `npm run build` will produce correct output; there's no fallback API fetch at runtime.
- **Types are generated, not hand-written**: `src/lib/payload-types.ts` and the output path is configured in `backend/src/payload.config.ts` (`typescript.outputFile`) — after changing a Payload collection/global, run `generate:types` in `backend/` rather than editing the type file directly.
- `data/`, `pglogfile`, `database.sql`, `result` (nix build symlink) are local/dev artifacts at the repo root — not source, don't treat as such (data/ is gitignored/permission-restricted).
- Two separate package managers in play: root frontend uses npm/bun; `backend/` uses pnpm (see its `packageManager`-like `engines`/`pnpm` fields) — don't mix lockfiles across the two.
- Frontend and backend have **independent** ESLint/Prettier/TS configs; run lint/format commands from the correct directory.
