# Pi config

> Global Pi config, synced via dotfiles symlink

## Extensions workspace

Package-style global extensions stay in `~/.pi/agent/extensions/` so Pi can auto-discover them from:

- `~/.pi/agent/extensions/*.ts`
- `~/.pi/agent/extensions/*/index.ts`

This directory is now the shared Bun workspace root for extensions with their own `package.json` files.

Install/update all extension dependencies from here:

```sh
bun install
```

Run workspace checks:

```sh
bun run check
```

After changing extension code or package settings, reload Pi with `/reload`.
