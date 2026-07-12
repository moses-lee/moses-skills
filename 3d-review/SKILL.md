---
name: 3d-review
description: Use when reviewing a pull request, branch, or code diff that needs a comprehensive assessment of its purpose, architecture, and implementation quality.
---

# 3D Review

Deliver an evidence-based **Diff**, **Design**, and **Detail** review. Use
subagents when available; otherwise use one agent.

## 1. PR context and net diff

When available, read the PR title, description, target, linked context, reviews,
comments, and unresolved discussion. Extract intent and constraints; do not
repeat resolved concerns unless the code warrants them. Verify metadata against
the diff and code. If no PR is available, say so and review the branch.

Resolve the PR base into `BASE_REMOTE`, `BASE_BRANCH`, and
`BASE_REF="$BASE_REMOTE/$BASE_BRANCH"`; default to `origin/main` only when the
target is unknown. Do not trust local `main`:

```bash
BASE_REMOTE=origin
BASE_BRANCH=<pr-base-branch-or-main>
BASE_REF="$BASE_REMOTE/$BASE_BRANCH"
git fetch "$BASE_REMOTE" "$BASE_BRANCH" --quiet
git merge-base "$BASE_REF" HEAD
git log --oneline "$BASE_REF"..HEAD
git diff --shortstat "$BASE_REF"...HEAD
git diff --stat "$BASE_REF"...HEAD
```

If refresh fails, say so; use an existing named remote ref only when available,
otherwise ask for or state the local baseline. Use history only for factual
summary, never as finding evidence.

Read the net diff and needed context. Inventory every path: code, test,
config/CI, dependencies, schema/migration, generated files, docs, and
renames/deletions. Distinguish PR-caused from pre-existing behavior.

Group by problems solved—not commits, files, or implementation steps. Use only
warranted themes, lead with user behavior, and assign each file one primary
theme. Cross-reference shared files without counting them twice.

Create the summary:

- Header: commit/file count, net `+X / -Y`, and **What the PR does**.
- **Prior PR context:** material intent, constraints, unresolved discussion.
- Per theme: `##`, `File | Why`, and the change/problem solved; add **Net
  effect** only when useful.
- **Tests:** `File | Covers`; **Verification:** results or `Not run`.

## 2. Independent discovery

Run first-pass reviewers in parallel. They inspect code directly and cannot see
each other's candidates. Assign a design reviewer plus theme owners; use spare
capacity for cross-cutting risks and record uncovered areas.

- **Design:** fit, architecture, boundaries, complexity, consistency,
  maintainability, and alternatives; flag unsound/over-engineered solutions.
- **Detail:** bugs, dead/duplicate code, anti-patterns, performance,
  security/reliability, regressions, and missing tests across owned themes.

Route auth/secrets → security; migrations/data writes → rollback/compatibility;
API/schema → backwards compatibility; concurrency/cache/retries → reliability;
dependencies/CI/IaC → deployment/supply chain. Apply
`vercel-react-best-practices` for React or Next.js changes.

Each candidate enters a ledger with an ID, theme, causal changed anchor,
evidence, claimed failure path, and validation status. Nits are in scope.

## 3. Adversarial validation

Treat candidates as untrusted. Independently validate them (batch in parallel),
trying to disprove each through diff/context, control/data flow,
tests/conventions, and reproduction. The author cannot validate its own finding.
With no subagent, record candidates then perform a distinct refutation pass.

The validator records code path, inputs/state, expected versus actual behavior,
and strongest practical proof: focused test/minimal repro, or static trace plus
why testing was impractical. Classify **valid**, **invalid**, or **insufficient
evidence**; report only valid items.

Before synthesis, recheck PR causality, accuracy, duplication, and severity. A
finding may manifest in unchanged code, but cite the causal hunk and optionally
the affected consumer/test. Do not collapse discovery → refutation → synthesis.

## Report

Use this order:

1. `# PR / Branch Summary` — the summary above.
2. `# Design Review` — strengths and concerns, or state that none survived.
3. `# Detailed Findings` — valid findings by severity: critical, high, medium,
   low, then nit; identify each finding's theme.

For each finding include **Context** (behavior, failure mode, impact),
**Severity**, **Location**, and **Recommended fix and reasoning**. Severity is
impact-based: critical = serious security/data/outage risk; high = likely
meaningful user/reliability regression; medium = bounded; low = minor; nit =
non-blocking polish.

End with **Residual risk / coverage**: untested high-risk paths, verification
limits, and whether no findings means validated clean or not assessable. Update
**Verification** after validation. Be comprehensive without padding; do not
double-count churn, report rejected claims, or present speculation as findings.
