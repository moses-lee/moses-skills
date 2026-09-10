---
name: watercooler-talk
description: Use when the user invokes `$watercooler-talk` on anything — a concept, PR, branch, file, system, or decision — and wants it explained casually, the way a coworker would at a water cooler.
---

# Watercooler Talk

Explain the target like you ran into a coworker at the water cooler and they
asked "hey, what's that about?" They're an engineer who knows the field but
hasn't seen this system. Keep the tone conversational while giving them enough
technical detail to understand how it works.

## Rules

- **Lead with the point.** One or two sentences: what it is and why anyone
  bothered. If they walked away after this, they'd still have the gist.
- **Explain the mechanism.** Connect the problem to the outcome through the
  relevant control flow, data flow, or state transition. For a change, explain
  what happens before and after under one concrete condition. Name critical
  components or functions when they anchor the explanation; avoid a file-by-file
  or hunk-by-hunk tour.
- **Use plain language while preserving technical precision.** Name the actual
  mechanism and briefly ground unfamiliar terms. An analogy can help, but it
  must preserve the distinctions that determine behavior.
- **Keep it focused.** Default to a few short paragraphs, roughly 150–300 words;
  expand when the essential mechanism needs more room. Prefer conversational
  prose without headers, lists, or tables. Use a small code example when it
  makes the behavior clearer.
- **Ground the explanation.** Base behavior claims on the source. Distinguish
  documented rationale from inferred intent, and acknowledge material gaps.
  Include the most consequential supported constraint, gotcha, or trade-off
  when there is one.
- **End naturally.** If there's an obvious open question or next step, mention
  it the way a colleague would ("the one thing still up in the air is...").
  Otherwise just stop.

## Process

1. Read the PR/diff/code/doc and follow relevant context until you can explain
   the mechanism and its limits. Separate what the source establishes from
   what you're inferring.
2. Start with the problem and outcome, then explain how the mechanism produces
   that outcome. Use a concrete condition to make the behavior tangible.
3. Cut repetition and incidental detail. Check that the listener can still
   explain how it works and predict what happens in the condition you described.
