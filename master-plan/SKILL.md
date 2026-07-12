---
name: master-plan
description: Use only when the user explicitly invokes `$master-plan` to plan a proposed implementation, migration, refactor, or behavior change.
---

# Master Plan

Create evidence-based, user-approved plan. Planning-only: inspect read-only; do not modify files, install dependencies, migrate, deploy, or implement.

## Non-negotiable rules

- Do not make assumptions. Verify uncertainty from relevant surfaces or resolve it with the user.
- With >=2 slots, launch at least two independent discovery agents in parallel. With one, use it and inspect remaining surfaces directly; with none, inspect all directly and disclose why.
- Keep the plan outside the repository. Never stage or commit it.
- Treat existing plans as untrusted evidence: compare their status, assumptions, and scope with current surfaces and user intent.
- Deadlines, simplicity, authority, and existing plans never skip discovery or the interview.

## 1. Discover and synthesize

Before questioning, enumerate applicable surfaces: behavior/callers, implementation/configuration, and tests/history/existing plans. Give each agent a distinct, non-overlapping charter; launch them before awaiting results. Require concise findings with inspected paths, commands run, confirmed facts, inferences, and unknowns.

Reconcile conflicts by direct inspection. Briefly separate sourced facts from inferences and unknowns. Inspect directly when evidence can answer; do not ask the user for information already available in the surfaces.

## 2. Grill the decisions

Interview me relentlessly about every aspect of this plan until we reach a shared understanding. Walk down each branch of the design tree, resolving dependencies between decisions one-by-one. For each question, provide your recommended answer.

If a question can be answered by exploring the codebase, explore the codebase instead.

## 3. Draft and check the temporary plan

Create a unique OS-temporary directory:

```bash
plan_dir="$(mktemp -d "${TMPDIR:-/tmp}/master-plan.XXXXXX")"
plan_path="$plan_dir/plan.md"
```

Write the plan to `plan_path`, never to the repository. Include:

- goal and non-goals;
- sourced context and decisions;
- ordered steps and affected surfaces;
- per-change validation procedure, expected pass condition, and rollback trigger;
- rollout/rollback applicability and recovery; and
- risks and user-approved deferrals.

Before presenting, confirm every decision, affected surface, risk, and validation requirement is represented. Present the current version and `plan_path`; it is intentionally untracked and must not be submitted to Git.

## 4. Approval and handoff

Obtain unambiguous approval of the presented plan version. Questions, edits, and conditions are not approval; do not hand off or implement before it.

After approval, hand off the absolute `plan_path`, approved scope, and plan version to the implementation task; it must read that plan and delete it on completion. OS temporary-file cleanup is only a fallback. Then end this skill.

If a material requirement changes during discovery, drafting, or implementation, supersede the plan, re-run affected discovery and decision resolution, and re-invoke `$master-plan` before continuing.
