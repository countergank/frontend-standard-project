// Commitlint flat config — enforces Conventional Commits for the template.
// Shared config sourced from @commitlint/config-conventional, which permits the
// commit types used across this repo (feat, fix, chore, test, docs, refactor, ci,
// style, perf, build, revert) plus the default scopes and rules it ships with.
import type { UserConfig } from "@commitlint/types";

const config: UserConfig = {
  extends: ["@commitlint/config-conventional"],
};

export default config;
