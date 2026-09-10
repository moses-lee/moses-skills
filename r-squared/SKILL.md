---
name: r-squared
description: Verify PR review findings and assess whether they warrant action.
---

# R-Squared

Try to disprove each finding against current code, callers, invariants, and tests; reviewer confidence isn't evidence.
Require a concrete failure scenario to accept it; otherwise mark uncertainty.
Check whether the PR introduces or worsens it, then weigh impact, scope, and fix cost/risk.
Report each finding: supported/refuted/uncertain → fix here/defer/no action, citing evidence and justifying deferral.
Assess only unless fixes or replies are requested.
