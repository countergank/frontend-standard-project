# Tasks: Standard Frontend Template

## Review Workload Forecast

| Field | Value |
|-------|-------|
| Estimated changed lines | ~3500–4500 |
| 400-line budget risk | High |
| Chained PRs recommended | Yes |
| Suggested split | PR1 skills → PR2 stack → PR3 architecture → PR4 testing → PR5 CI/CD → PR6 tooling → PR7 docs |
| Delivery strategy | ask-on-risk |
| Chain strategy | pending |

Decision needed before apply: Yes
Chained PRs recommended: Yes
Chain strategy: pending
400-line budget risk: High

### Suggested Work Units

| Unit | Goal | Likely PR | Focused test command | Runtime harness | Rollback boundary |
|------|------|-----------|----------------------|-----------------|-------------------|
| 1 | Skills integration (react-frontend) | PR 1 | `npx skills list` shows react-frontend | local npm | revert registry + skills-lock |
| 2 | Scaffold Vite+React19+TS+Tailwind/shadcn skeleton | PR 2 | `pnpm build` | `pnpm dev` | delete scaffolded src/config |
| 3 | Architecture: features dirs, shell, error handling | PR 3 | `pnpm test` (unit+comp) | `pnpm dev` | revert src/features + shell |
| 4 | Testing: Vitest+Testing Library+axe+Playwright, coverage | PR 4 | `pnpm test && pnpm test:e2e` | `pnpm test:e2e --headed` | remove e2e/ + config blocks |
| 5 | CI/CD: GitHub Actions + preview | PR 5 | `act` / CI status | push trigger | remove .github/workflows |
| 6 | Tooling/hygiene: commitlint, husky, Makefile, Dockerfile, .nvmrc | PR 6 | `make ci` | `make dev` | revert tooling files |
| 7 | Docs: docs/ + AGENTS.md + README | PR 7 | `make docs` / link check | local md render | revert docs/ |

## Phase 1: Skills (ticket #1)
- [ ] 1.1 Run `npx skills add countergank/skills`; verify `react-frontend` installs.
- [ ] 1.2 Write `skills-lock.json` pinning countergank skills (react-frontend).
- [ ] 1.3 Update `.atl/skill-registry.md` to register `react-frontend`; record Tailwind/shadcn deviation in agent config.

## Phase 2: Stack setup (ticket #2)
- [ ] 2.1 Scaffold `src/` skeleton: package.json (pnpm), .nvmrc, .editorconfig, .vscode.
- [ ] 2.2 Add `tsconfig.json` strict + `@/` alias; `vite.config.ts` with alias/env (`vite-001/002`).
- [ ] 2.3 Set Tailwind + shadcn/ui (Radix, CSS vars, darkMode class); `src/components/ui/`.
- [ ] 2.4 Add `biome.json` + ESLint a11y/recommended config (skill eslint asset).

## Phase 3: Architecture (ticket #3)
- [ ] 3.1 Create `src/features/<sample>` structure (components+hooks+api) demonstrating feature layout.
- [ ] 3.2 Build app shell: landmarks, skip link, `RouteAnnouncer` (skill asset), focus mgmt.
- [ ] 3.3 Add React Router lazy routes + Suspense; TanStack Query client + sample query.
- [ ] 3.4 Add typed `Error` subclasses + route `ErrorBoundary` + error UI (`react-011`).

## Phase 4: Testing (ticket #4)
- [ ] 4.1 Configure Vitest (jsdom, coverage thresholds) `vitest.config.ts` (skill asset).
- [ ] 4.2 RED: write failing unit/component tests per stack+architecture scenarios.
- [ ] 4.3 Add Testing Library + `userEvent` component tests; axe a11y assertions.
- [ ] 4.4 Add Playwright `e2e/` critical journeys (keyboard + reduced-motion).
- [ ] 4.5 Enable strict TDD in `openspec/config.yaml` once runner confirmed.

## Phase 5: CI/CD (ticket #5)
- [ ] 5.1 Add `.github/workflows/ci.yml`: lint, typecheck, test+coverage, build, e2e.
- [ ] 5.2 Add preview deploy step for PRs.

## Phase 6: Tooling & hygiene (ticket #6)
- [ ] 6.1 Add `commitlint.config.ts` (conventional commits) + husky hooks.
- [ ] 6.2 Add `Makefile` (dev/test/ci) + `Dockerfile` + `.env.example`/`.env.test`.

## Phase 7: Documentation (ticket #7)
- [ ] 7.1 Add `docs/` (ADR, folder structure, component patterns, error handling, a11y policy, testing strategy).
- [ ] 7.2 Add `AGENTS.md` pointing to countergank skills + repo standards.
- [ ] 7.3 Write README (purpose, quickstart, consumption guide).
- [ ] 7.4 Verify doc links and agent-readable standards resolve.

## Implementation order
Skills (1) → stack (2) → architecture (3) → testing (4) → CI/CD (5) → tooling (6) → docs (7),
strictly by dependency; each maps to one Linear ticket assigned to Leandro Cepeda.
