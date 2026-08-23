# Pi Agent Workspace

> Bun workspace for Pi agent extensions

## Structure

```
.pi/
├── package.json          # Workspace root: workspaces = ["agent/extensions/*"]
├── tsconfig.json         # Strict, bundler mode, ESNext, noEmit
├── agent/
│   ├── settings.json     # Provider, model, theme, packages
│   └── extensions/       # Local TypeScript extensions
│       ├── <name>/       # Pi extension
│       ├── <name>/test/  # Pi extension tests
```

Skills live in `~/.agents/skills/`. **Do not** install them here.

## Where to look

| Task | Location |
|---|---|
| Change default model/provider | `~/.pi/agent/settings.json` |
| Add Pi package | `~/.pi/agent/settings.json` → `packages[]` |
| Create extension | `~/.pi/agent/extensions/<name>/` with `package.json` |
| Create standalone extension | `~/.pi/agent/extensions/<name>.ts` |
| Create skill | `~/.agents/skills/<name>/SKILL.md` |

## Conventions

- Extensions as Bun workspace packages: each have their own `package.json`
- Standalone extensions: single `.ts` file in `~/.pi/agent/extensions/`
- Skills: `SKILL.md` as entry under `~/.agents/skills/`, optional bundled resources
- ESM only: `"type": "module"` everywhere
- Dependencies: `@earendil-works/pi-ai`, `@earendil-works/pi-coding-agent`, `@earendil-works/pi-tui`
- TypeScript strict mode: `noUncheckedIndexedAccess`, `noImplicitOverride`

## Anti-patterns

- Installing deps at workspace root for extension-specific needs (use per-package)
- Committing `node_modules/` (gitignored per-extension)
- Editing `~/.pi/agent/settings.json` outside dotfiles repo
- Adding runtime state files to git (most of `~/.pi/agent/*` is gitignored, only extensions/settings un-ignored)
- Duplicating skills under `~/.pi/agent/skills/`, they belong in `~/.agents/skills/`
