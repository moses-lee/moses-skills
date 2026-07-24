---
name: 5d-review
description: Use only when the user explicitly invokes `$5d-review` for an architecture-first review of a pull request, branch, or code diff.
---

# 5D Review

Understand the problem, map the change, and judge the solution before its implementation. Optimize for decision value. Treat user-supplied focus as additive without inferring requirements or targets.

## Keep agents fresh

The coordinator creates the smallest set of fresh, non-overlapping subagents that keeps each context focused. Delegates do not spawn agents. Use new agents across discovery, solution judgment, implementation review, and validation. Give each a bounded question, primary sources, and a checkable output; keep discovery agents blind to others' conclusions.

## 1. Establish context

Determine the **fixed point** from the user's target or PR metadata. Refresh and verify its remote ref and intended non-empty net diff. Ask when uncertain; never default to local `main`.

Send fresh scouts through material primary sources. Synthesize a **review contract**: problem, expected behavior, scale, constraints, success criteria, and focus. User answers and accepted specifications or decisions govern requirements; repository policy governs local constraints; general heuristics override neither.

Investigate facts; ask the user for unresolved decisions. Pause when an unknown could reverse solution judgment or materially change a finding. Prefer structured input with grounded suggestions and a free-form option; otherwise ask about exactly one highest-leverage decision with suggestions. End the turn immediately and defer every other decision. Proceed when all material unknowns are resolved; if one cannot be, report solution fit as not assessable and stop.

## 2. Map the change

Partition the net diff into **review units**, each covering one behavior, contract, or data flow. State its before-and-after behavior, mechanism, paths, and tests.

Split units that can fail, change, or revert independently. Account for every changed path without narrating every hunk. Allow files in multiple units and collapse mechanical churn.

## 3. Apply the solution gate

Give the contract, change map, and sources to a fresh architecture reviewer. Judge necessity, proportionality, boundaries, ownership, dependencies, and operational cost from first principles.

If it rejects the solution, a fresh challenger must try to disprove it. Stop before implementation review only when the rejection survives: the design conflicts with the contract or adds material avoidable cost. Report the decision and ask whether to continue despite it.

## 4. Review craft and correctness

After the solution passes or the user overrides the gate, bundle related units and focus areas into fresh, bounded assignments.

Apply the **change-friction test**: does the structure localize the next likely change, or make the code unnecessarily costly to understand, change, test, or operate? Report poor taste and sloppiness when that cost is concrete.

Review correctness against the contract under plausible operating and adversarial conditions. Weigh likelihood and impact. Finish when every unit and focus has an evidence-backed disposition.

## 5. Validate findings

Give candidate batches to fresh non-author validators. They try to disprove causality, plausibility, and impact using requirements and primary code evidence, with focused reproduction when practical.

Report only findings that survive. Require causality to the change; for omissions, cite the unmet requirement and absent behavior.

## Report

Report the contract and focus, change map, solution decision, craft assessment, findings ordered by impact and likelihood, verification, and residual risk.

For each finding give behavior and impact, changed or missing location, evidence, and the governing constraint. Diagnose without prescribing; the PR author owns what to change. Separate change-caused from pre-existing behavior; history is context only.

When the solution gate stops the review, end there and ask permission to continue.
