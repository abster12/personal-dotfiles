# Global agent instructions

This file is the user-global instruction file. Agents may read and edit it.

Pi loads it via `~/.pi/agent/AGENTS.md` (symlink to this file).

## Language

Write every reply in the Google developer documentation style guide and ASD-STE100 Simplified Technical English: short sentences, active voice, common words.

Use everyday words. Keep a specialist term only when it is the name of code, a file, or an API.

Say interface, module edge, package edge, or the package name. Never say "seam".

## graphify

**graphify** (`~/.agents/skills/graphify/SKILL.md`) — any input to a knowledge graph. Trigger: `/graphify`
When the user types `/graphify`, load that skill before doing anything else.

## UI

On React/Tailwind UI: use a ReUI component from https://reui.io/components (`npx shadcn@latest add`) before writing a custom one.

<!-- ## Prewalk

On a spec or multi-file feature, serial — each step starts only after the previous result is in this session:
1. `scout` with `async:false`. Write the DAG from that output only.
2. Implement node 1 yourself.
3. `worker` per later node (one node, self-contained task).
4. `reviewer` with `async:false` on the diff; fix its findings.
5. `oracle` with `async:false`. Done when it has no P0/P1.
Skip for questions, one-file fixes, and “just you.” -->
