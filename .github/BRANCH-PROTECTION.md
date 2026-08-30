# Branch Protection — verified real state

This document reflects the **current, verified** branch protection configuration on
`develop`, `staging`, and `main`, plus the single pending item to associate CI once it
exists.

> Status: protection is **already configured**. This is a record, not a to-do.

## Current protection (verified)

All three environment branches (`develop`, `staging`, `main`) have:

- **Pull request required** — direct pushes blocked; PR-only workflow.
- **1 required reviewer** (`required_approving_review_count = 1`).
- **Dismiss stale reviews** — re-approval required after new commits.
- **Require last push approval** (`require_last_push_approval = true`).
- **Force pushes blocked** (`allow_force_pushes = false`).
- **Deletions blocked** (`allow_deletions = false`).
- **Enforce administrators / Include administrators** (`enforce_admins = true`).
- **Admin bypass** user: `leandrojaviercepeda`
  (`bypass_pull_request_allowances.users = ["leandrojaviercepeda"]`, teams/apps empty)
  for solo self-merge. **Remove this bypass when the team grows.**

```json
{
  "required_status_checks": { "strict": false, "contexts": [] },
  "enforce_admins": true,
  "required_pull_request_reviews": {
    "required_approving_review_count": 1,
    "dismiss_stale_reviews": true,
    "require_last_push_approval": true,
    "bypass_pull_request_allowances": {
      "users": ["leandrojaviercepeda"],
      "teams": [],
      "apps": []
    }
  },
  "restrictions": null,
  "allow_force_pushes": false,
  "allow_deletions": false
}
```

## Pending item: required status checks (CI)

`required_status_checks.contexts` is currently **empty** on all three branches because
**CI does not exist yet** (planned for Phase 6 — `.github/workflows/ci.yml`).

Once the CI workflow lands (Phase 6), the CI check **MUST be associated with all three
branch protections** (`develop`, `staging`, `main`). Do this in repository settings →
Branches → each branch protection rule → "Require status checks to pass before merging" →
select the CI check.

## Note on branch source restrictions

Per the `git-environment-flow` skill, staging should only receive `release/*` and main
should only receive `release/*` / `hotfix/*`. Track the source-branch restrictions as a
follow-up when releases begin; the current rule set above is the verified baseline.
