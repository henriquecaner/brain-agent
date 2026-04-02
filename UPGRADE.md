# 🔄 Upgrade Guide

> How to upgrade to a new version **without losing your customizations**.

---

## Upgrade Philosophy

This template is designed to be **forked and customized**. Your `.specs/` docs, rules, and skills contain project-specific content that should **never be overwritten**. Upgrades only add **new files** and **surgical edits** to existing ones.

> **Golden Rule:** We never overwrite your customized files. Upgrades are always additive.

---

## v1.x → v2.0.0

**What's new:** Complete migration from `Brain/` directory to `.specs/` architecture. This is a **breaking change** — the internal memory system was restructured for clarity and modularity.

### What Changed

| Before (v1.x) | After (v2.0.0) |
|---|---|
| `Brain/PROJECT_CORE.md` | `.specs/project/STACK.md` |
| `Brain/ARCHITECTURE_DEEP_REVIEW.md` | `.specs/project/ARCHITECTURE.md` |
| `Brain/DECISION_LOG.md` + `Brain/RISKS_ISSUES.md` | `.specs/project/STATE.md` (unified) |
| `Brain/ACTIVE_TASKS.md` | `.specs/features/[feature]/tasks.md` |
| `Brain/ROADMAP_SPRINTS.md` | `.specs/project/ROADMAP.md` |
| `Brain/DESIGN_SYSTEM.md` | `.specs/project/CONVENTIONS.md` |
| `Brain/TECHNICAL_SPEC.md` | `.specs/project/ARCHITECTURE.md` (merged) |
| `Brain/STATUS_REPORT.md` | `.specs/project/STATE.md` (merged) |

### Option A: The AI-Automated Migration (Recommended)

Since you are using the Brain+Agent architecture, why do this manually? You can use your AI's planning mode to execute the entire migration for you safely.

Open Antigravity (or your AI of choice) at the root of your project and paste this **Master Prompt**:

> **"I need to upgrade my project's Brain-Agent architecture from v1.x to v2.0.0. Please enter your step-by-step planning mode to perform the following actions:**
> 
> **1. Create the new `.specs/project` and `.specs/features` directories.**
> **2. Read the contents of all my existing markdown files in the `Brain/` directory.**
> **3. Migrate the data to the new structure:**
> **   - Migrate `Brain/PROJECT_CORE.md` to `.specs/project/STACK.md`**
> **   - Migrate `Brain/ARCHITECTURE_DEEP_REVIEW.md` and `Brain/TECHNICAL_SPEC.md` into a unified `.specs/project/ARCHITECTURE.md`**
> **   - Migrate `Brain/DECISION_LOG.md`, `Brain/RISKS_ISSUES.md`, and `Brain/STATUS_REPORT.md` into a unified `.specs/project/STATE.md`**
> **   - Migrate `Brain/ROADMAP_SPRINTS.md` to `.specs/project/ROADMAP.md`**
> **   - Migrate `Brain/DESIGN_SYSTEM.md` to `.specs/project/CONVENTIONS.md`**
> **4. Delete the obsolete `Brain/` directory.**
> **5. Download the latest v2.0.0 template via terminal:**
> **   Run: `git clone --depth 1 https://github.com/henriquecaner/brain-agent.git /tmp/brain-v2`**
> **6. Copy the new advanced v2.0 skills and workflows:**
> **   - Force overwrite your local `.agents/skills/brain/` with `/tmp/brain-v2/.agents/skills/brain/`**
> **   - Copy `/tmp/brain-v2/.agents/skills/testing/` to your `.agents/skills/`**
> **   - Overwrite your local `.agents/workflows/` with `/tmp/brain-v2/.agents/workflows/`**
> **   - Clean up: `rm -rf /tmp/brain-v2`**
> **7. Update my `.agents/rules/universal-agent-rules.md` to point root to `.specs/`, map the new spec files, AND ensure the new `testing` skill is registered in the routing table.**
> **8. Scan all my local `.agents/skills/` and replace any `Brain/` path references with their new `.specs/project/` equivalents.**
> 
> **Please present your implementation plan first for my approval before executing any file creations or modifications."**

*Once the AI finishes completing the steps above, your upgrade to v2.0.0 is complete!*

---

### Option B: The Manual Migration

If you prefer to migrate files by hand instead of using the automated Master Prompt, follow the steps below:

#### Step 1: Create the new `.specs/` structure

```bash
mkdir -p .specs/project .specs/features
```

#### Step 2: Migrate your data

Move your filled Brain docs into the new structure:

```bash
# Core docs — copy content manually, file names changed
# Brain/PROJECT_CORE.md        → .specs/project/STACK.md
# Brain/ARCHITECTURE_DEEP_REVIEW.md → .specs/project/ARCHITECTURE.md
# Brain/DECISION_LOG.md        → .specs/project/STATE.md (merge with RISKS_ISSUES)
# Brain/ROADMAP_SPRINTS.md     → .specs/project/ROADMAP.md
```

#### Step 3: Update your rules (if customized)

If you customized `.agents/rules/universal-agent-rules.md`, apply these changes:

```diff
 ## 1. CONTEXT & MEMORY PROTOCOL
-**Root:** `Brain/` (Source of Truth).
+**Root:** `.specs/` (Source of Truth).

-| **@PROJECT_CORE** | `Brain/PROJECT_CORE.md` | Scope, Goals, Tech Stack. |
-| **@ARCHITECTURE** | `Brain/ARCHITECTURE_DEEP_REVIEW.md` | Technical deep dive. |
-| **@ACTIVE_TASKS** | `Brain/ACTIVE_TASKS.md` | Task tracker. |
+| **@STACK** | `.specs/project/STACK.md` | Scope, Goals, Tech Stack. |
+| **@ARCHITECTURE** | `.specs/project/ARCHITECTURE.md` | Technical deep dive. |
+| **@TASKS** | `.specs/features/[feature]/tasks.md` | Feature task tracker. |
+| **@STATE** | `.specs/project/STATE.md` | Decisions, blockers, risks. |
```

#### Step 4: Update your skills (if customized)

Replace any `Brain/` paths in custom skills:

```diff
-1.  **Architecture:** `Brain/ARCHITECTURE_DEEP_REVIEW.md`
+1.  **Architecture:** `.specs/project/ARCHITECTURE.md`
```

#### Step 5: Clean up

```bash
rm -rf Brain/
```

#### Step 6: Verify

Open Antigravity and ask: *"Read .specs/project/STACK.md and confirm you understand the project."*

---

## v1.0.0 → v1.1.0

**What's new:** Post-Execution Sync Workflow — automatic spec & Skills updates after complex tasks.

### Step 1: Copy the new workflow file (safe — no conflicts)

```bash
curl -o .agents/workflows/post-execution-sync.md \
  https://raw.githubusercontent.com/henriquecaner/brain-agent/v1.1.0/.agents/workflows/post-execution-sync.md
```

### Step 2: Add Step 7 to your "Do Work" Loop

Open `.agents/rules/universal-agent-rules.md` and find the **"Do Work" Loop** (§5.A). Add **line 7**:

```diff
+7.  **Sync:** For COMPLEX/ORCHESTRATE tasks, run `/post-execution-sync` workflow to update spec docs and evaluate Skills.
```

### Step 3: Add the routing entry

In the same file, find the **Dynamic Skill Loading** table (§3) and add this row:

```diff
+| **Post-Execution, Sync** | `.agents/workflows/post-execution-sync.md` | Auto-sync specs & Skills after changes. |
```

---

## How Upgrades Work

Each release in this repo includes:

1. **CHANGELOG.md** — What changed and why
2. **UPGRADE.md** — Exact steps to apply the changes to your project (this file)
3. **GitHub Release** — Diff link showing all changes: `compare/vX.X.X...vY.Y.Y`

### What's safe to upgrade (additive files)
- **New workflows** in `.agents/workflows/` → Just copy them
- **New skills** in `.agents/skills/` → Just copy the folder
- **New spec templates** in `.specs/` → Only copy if you don't have a file with the same name

### What requires manual merge (customized files)
- `.agents/rules/universal-agent-rules.md` → Follow the diff instructions per version
- `.agents/rules/engineering-laws.md` → Follow the diff instructions per version

### What you can ignore (template docs)
- `README.md`, `CUSTOMIZATION.md` → These are for the template repo, not your project
- `install.sh`, `bin/*` → Only relevant for initial setup
