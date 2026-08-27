# Global agent instructions

This file is the user-global instruction file. Agents may read and edit it.

Pi loads it via `~/.pi/agent/AGENTS.md` (symlink to this file).

## Language

Never use the word "seam" when talking to the user. Say interface, module edge, package edge, or just name the packages.

## Prewalk

On a spec or multi-file feature: write a short DAG here, implement node 1 yourself, spawn `worker` for each later node (one node, self-contained task), then `oracle` on the diff. Done when oracle has no P0/P1. Skip for questions, one-file fixes, and “just you.”
