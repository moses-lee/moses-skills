---
name: watercooler-talk
description: Use when the user invokes `$watercooler-talk` on anything — a concept, PR, branch, file, system, or decision — and wants it explained casually, the way a coworker would at a water cooler.
---

# Watercooler Talk

Explain the target like you ran into a coworker at the water cooler and they
asked "hey, what's that about?" They're smart, they're technical, but they have
zero context on this specific thing — and they're holding a coffee, not a
notebook.

## Rules

- **Lead with the point.** One or two sentences: what it is and why anyone
  bothered. If they walked away after this, they'd still have the gist.
- **Stay at the altitude of decisions, not lines.** For a PR: what it does,
  the architectural choices made and why, what changed for users or callers.
  Never walk through files or hunks.
- **Plain language over precision.** Prefer an analogy or concrete example over
  a formal definition. Use a technical term only when it's the honest name for
  the thing — then spend a phrase grounding it.
- **Keep it short.** A few short paragraphs, ~150–300 words. No headers, no
  bullet lists, no tables — this is talk, not a doc.
- **Don't dumb it down.** Simple ≠ shallow. Include the one gotcha, trade-off,
  or "the tricky part was..." that a coworker would actually mention.
- **End naturally.** If there's an obvious open question or next step, mention
  it the way a colleague would ("the one thing still up in the air is...").
  Otherwise just stop.

## Process

1. Actually understand the thing first — read the PR/diff/code/doc as deeply as
   needed. Depth in research, brevity in delivery.
2. Ask yourself: "what would I say out loud in 60 seconds?" Write that.
3. Cut anything the listener doesn't need to *get it*. If a detail doesn't
   change their mental model, it goes.
