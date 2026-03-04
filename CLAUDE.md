# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Commands

```bash
bun run dev      # Start development server on http://localhost:3000
bun run build    # Production build
bun run lint     # Biome check
bun run lint:fix # Biome check with auto-fix
bun run format   # Biome format (write)
bun run test     # Run Vitest (use this, not `bun test`)
```

Run a single test file:
```bash
bunx vitest path/to/file.test.tsx
```

> **Note:** `bun test` invokes Bun's native runner and will fail — always use `bun run test`.

## Architecture

This is a **Next.js 16 App Router** project with TypeScript, React 19, and Tailwind CSS v4.

- `app/layout.tsx` — Root layout with Geist font variables and global metadata
- `app/page.tsx` — Home page (Server Component by default)
- `app/globals.css` — Global styles; uses Tailwind v4's `@import "tailwindcss"` syntax and `@theme inline` for CSS variable theming

**Path alias:** `@/*` resolves to `src/` (e.g., `@/app/...`, `@/components/...`).

**Styling:** Tailwind v4 via PostCSS. Theme tokens (`--color-background`, `--color-foreground`, `--font-sans`, `--font-mono`) are defined in `globals.css` using `@theme inline`, not `tailwind.config`. Dark mode uses `prefers-color-scheme` media query.

**TypeScript:** Strict mode enabled. `moduleResolution: "bundler"`.

**Linting/Formatting:** [Biome](https://biomejs.dev) (`biome.json`) — replaces ESLint and Prettier. Recommended rules enabled with Next.js and React domains. Imports are auto-organized. Indent style: 2 spaces.

**Testing:** Vitest (`vitest.config.mts`) with jsdom environment, `@testing-library/react`, and `vite-tsconfig-paths` (so `@/*` aliases work in tests).
