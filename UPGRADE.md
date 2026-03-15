# 🔄 Upgrade Guide

> How to upgrade to a new version **without losing your customizations**.

---

## Upgrade Philosophy

This template is designed to be **forked and customized**. Your `Brain/` docs, rules, and skills contain project-specific content that should **never be overwritten**. Upgrades only add **new files** and **surgical edits** to existing ones.

> **Golden Rule:** We never overwrite your customized files. Upgrades are always additive.

---

## v1.0.0 → v1.1.0

**What's new:** Post-Execution Sync Workflow — automatic Brain & Skills updates after complex tasks.

### Step 1: Copy the new workflow file (safe — no conflicts)

```bash
# From your project root, download the new workflow directly:
curl -o .agents/workflows/post-execution-sync.md \
  https://raw.githubusercontent.com/henriquecaner/brain-agent/v1.1.0/.agents/workflows/post-execution-sync.md
```

Or manually: copy [post-execution-sync.md](https://github.com/henriquecaner/brain-agent/blob/v1.1.0/.agents/workflows/post-execution-sync.md) into your `.agents/workflows/` folder.

### Step 2: Add Step 7 to your "Do Work" Loop

Open `.agents/rules/universal-agent-rules.md` and find the **"Do Work" Loop** (§5.A). Add **line 7**:

```diff
 ### A. The "Do Work" Loop
 1.  **Gate:** Pass Socratic Gate.
 2.  **Skill:** Load relevant `.agents/skills/` skill.
 3.  **Plan:** Update `@ACTIVE_TASKS` to `[IN PROGRESS]`.
 4.  **Execute:** Write Code (Adhering to Skill + Universal Code Rules).
 5.  **Verify:** Run checks (lint, type check, tests).
 6.  **Document:** Update `@ACTIVE_TASKS` to `[DONE]`.
+7.  **Sync:** For COMPLEX/ORCHESTRATE tasks, run `/post-execution-sync` workflow to update Brain docs and evaluate Skills.
```

### Step 3: Add the routing entry

In the same file, find the **Dynamic Skill Loading** table (§3) and add this row:

```diff
 | **Planning, Architecture** | `.agents/skills/create-plan/SKILL.md` | Project breakdown & roadmap. |
 | **Code Review, PR** | `.agents/skills/code-review/SKILL.md` | Code review checklist & patterns. |
 | **Debugging, Errors** | `.agents/skills/debugging/SKILL.md` | Systematic debugging workflow. |
+| **Post-Execution, Sync** | `.agents/workflows/post-execution-sync.md` | Auto-sync Brain & Skills after changes. |
```

### Step 4: Verify

That's it! Test by asking the AI to do a complex task and verifying it runs the sync at the end.

> **Note:** The `post-execution-sync.md` workflow has sensible defaults. You can customize the trigger criteria and Brain update rules inside it to match your project's specific needs.

---

## How Upgrades Work

Each release in this repo includes:

1. **CHANGELOG.md** — What changed and why
2. **UPGRADE.md** — Exact steps to apply the changes to your project (this file)
3. **GitHub Release** — Diff link showing all changes: `compare/vX.X.X...vY.Y.Y`

### What's safe to upgrade (additive files)
- **New workflows** in `.agents/workflows/` → Just copy them
- **New skills** in `.agents/skills/` → Just copy the folder
- **New Brain templates** in `Brain/` → Only copy if you don't have a file with the same name

### What requires manual merge (customized files)
- `.agents/rules/universal-agent-rules.md` → Follow the diff instructions per version
- `.agents/rules/engineering-laws.md` → Follow the diff instructions per version

### What you can ignore (template docs)
- `README.md`, `SETUP_GUIDE.md`, `CUSTOMIZATION.md` → These are for the template repo, not your project
- `setup.sh`, `bin/*` → Only relevant for initial setup

---

## Quick Upgrade via AI Prompt

If you're using Antigravity, you can paste this prompt to let the AI handle the upgrade:

> "Upgrade the Brain + Agent architecture to v1.1.0. Read the UPGRADE.md at https://github.com/henriquecaner/brain-agent/blob/main/UPGRADE.md and apply only the changes for my current version. Do NOT overwrite any customized Brain docs or rules — only add new files and make surgical edits."
