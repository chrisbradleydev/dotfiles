---
name: self-optimizing-system
description: >-
  Archives high-signal user interactions as JSON artifacts and proposes novel
  Rules, Skills, Subagents, and Commands when evidence and novelty gates pass.
  Detailed user prompts and corrective feedback are the highest priority.
  Use before and after planning and implementation, and whenever the user
  states lasting preferences or process feedback. Archives autonomously;
  never creates or edits Rules, Skills, Subagents, or Commands without
  explicit user acceptance of a proposal.
license: MIT
compatibility: >-
  Requires read access to all user prompts and LLM output. Requires write
  access to this skill's archive/ directory (skill-root-relative).
metadata:
  short-description: Archives interactions and proposes novel agent improvements
---

# Self-Optimizing System

Archives high-signal interactions under `<skill-root>/archive`, then proposes
_novel_ agent improvements (Rules, Skills, Subagents, Commands) only when
quality gates pass. Prefer silence over weak proposals.

## When to act

Act without being asked:

- Before planning (capture intent and constraints)
- After planning (capture plan deltas and rejected approaches)
- After implementation (capture outcomes, corrections, "do this next time")
- Whenever the user gives detailed preferences, corrections, or process feedback

Do **not** act on trivial chitchat, one-off typos, or ephemeral task noise.

## Schema

Every artifact must validate against [artifact.schema.json](./schema/artifact.schema.json).
Quality conventions below are required by this skill even though the schema
keeps `data` and `annotations` intentionally unstructured.

## Archive location

`<skill-root>` is the directory containing this skill's `SKILL.md` (follow
symlinks). All archive reads and writes go to `<skill-root>/archive/`.

Resolve the archive directory in this order:

1. Use this skill's `fullPath` from agent context → parent directory of
   `SKILL.md` → `archive/`
2. Else use an install path and follow the symlink:
   `~/.agents/skills/self-optimizing-system/archive` or
   `~/.claude/skills/self-optimizing-system/archive` or
   `~/.cursor/skills/self-optimizing-system/archive`
3. Shell check when needed:
   `realpath ~/.agents/skills/self-optimizing-system/archive`

**Never** write to workspace-relative `./archive`. **Never** hardcode a clone
path (e.g. `~/Repos/.../skills/self-optimizing-system/archive`).

## Artifact creation

1. Extract signal — prefer verbatim user wording over paraphrased summaries
2. Check recent archive entries for near-duplicates; skip if already captured
3. Write one JSON file under the archive directory
4. Evaluate proposal gates (next section); propose only if all pass

**Filename**:
`<skill-root>/archive/YYYY-MM-DDTHH-MM-SSZ-<kind>-<short-slug>.json` (UTC).

### Required `data` keys

| Key       | Purpose                                                  |
| --------- | -------------------------------------------------------- |
| `kind`    | `interaction` or `proposal`                              |
| `summary` | One sentence, specific                                   |
| `signal`  | Verbatim or near-verbatim user prompt/feedback           |
| `context` | What was happening (`plan`, `implement`, `review`, etc.) |
| `outcome` | What changed or was decided                              |

### Required `metadata`

- `creationTimestamp`: RFC3339 UTC
- `annotations` (soft tags as needed):
  - `source`: where the signal came from
  - `priority`: use `high` for detailed feedback
  - `relatedProposal`: link interaction ↔ proposal filenames when relevant

## Proposal gates

After archiving (or when reviewing the archive), propose only if **all** gates pass:

1. **Evidence**: Cites ≥1 concrete archived signal (quote or artifact filename)
2. **Recurrence or high severity**: Pattern seen more than once, **or** a single high-cost/high-friction preference the user stated clearly
3. **Novelty**: Not already covered by existing project/user Rules, Skills, Subagents, Commands, or prior `kind=proposal` artifacts — scan the archive directory and known skill/rule locations before proposing
4. **Actionable specificity**: Names the artifact type, trigger, and intended behavior — not vague advice ("be more careful")
5. **Fit**: Chooses the lightest effective form (Rule ≺ Skill ≺ Subagent ≺ Command)

If any gate fails → archive the interaction only; do not propose.

### Proposal `data` keys

Include the shared keys above, plus:

| Key            | Purpose                                     |
| -------------- | ------------------------------------------- |
| `proposalType` | `rule`, `skill`, `subagent`, or `command`   |
| `title`        | Short name                                  |
| `rationale`    | Why, tied to evidence                       |
| `draft`        | Minimal draft content the user could accept |
| `evidence`     | Artifact filename(s) or quoted signals      |
| `noveltyCheck` | What was compared and why this is new       |

## Surfacing proposals

When gates pass, tell the user briefly:

- What to add (type + title)
- Why (1-2 evidence bullets)
- Draft sketch
- Ask for accept / revise / reject

**Hard stop**: Never create or edit Rules, Skills, Subagents, or Commands unless the user explicitly accepts.

- **Accept** → help create it using the appropriate create-\* skill
- **Reject** → archive a short note with `outcome=rejected` so the same idea is not re-proposed
- **Revise** → update the proposal draft and re-confirm before materializing

## Anti-patterns

- Proposing from a single ambiguous utterance
- Duplicating existing Rules or Skills
- Mega-skills that restate generic agent behavior
- Archiving secrets, credentials, or irrelevant large dumps
- Rewriting user feedback into vague summaries that lose force
- Inventing proposals when evidence or novelty is weak
