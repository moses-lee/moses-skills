---
name: game-plan
description: Build an implementation plan for supplied issues, incorporating mechanical fixes and resolving judgment calls with the user one at a time.
---

# Game Plan

This skill produces a complete implementation plan. Across user replies,
investigate and record decisions without implementing changes, including
mechanical fixes.

Add mechanical fixes directly to the plan. Investigate judgment calls,
then resolve them with the user one at a time. Use watercooler-talk
for explanations; these instructions govern questions and workflow.

In Plan mode, use request_user_input with one question and 2–3 viable
options. Put the recommendation first and explain trade-offs; the UI
allows custom answers. Outside Plan mode, use a permitted interactive
question tool when available; otherwise ask in text.

After each answer, record the decision and continue to the next
unresolved question. Answers update the plan, not implementation
authorization.

Once all questions are resolved, present the consolidated plan with
implementation steps and validation, then stop. Implement only when
the user directs execution of the completed plan and the active mode
permits it.
