# 🛠️ Setup Guide

> Step-by-step guide to install, configure, and onboard your team.

---

## 🧠 The Mental Model (Read First)
Before you install, understand the shift:
1. **The Brain (`/Brain/`)** is your project's permanent long-term memory. It bypasses the AI's limited context window by forcing the Assistant to read your rules, architecture, and current sprint state *before* it begins coding.
2. **The Skills (`/.agents/skills/`)** are specialized experts. You write custom Markdown files teaching the AI exactly how to use your specific UI library or deploy commands. The orchestrator routes the AI to these skills ONLY when relevant, saving tokens and preventing confusion.

---

## Prerequisites

- A software project with a Git repository
- An AI coding assistant that reads workspace files (Claude Code, Cursor, Copilot, etc.)
- Basic familiarity with Markdown

---

## 1. Installation

### Automated (Recommended)

```bash
# From this template directory
chmod +x setup.sh
./setup.sh
```

The script will:
1. Ask for your project name
2. Ask for the target directory (your project root)
3. Copy `Brain/` and `.agents/` to the target
4. Replace all `{{PROJECT_NAME}}` placeholders
5. Print a customization checklist

### Manual

```bash
# Copy directories to your project root
cp -r Brain/ /path/to/your-project/Brain/
cp -r .agents/ /path/to/your-project/.agents/

# Replace placeholders (macOS)
find /path/to/your-project/Brain/ /path/to/your-project/.agents/ \
  -name "*.md" -exec sed -i '' 's/{{PROJECT_NAME}}/YourProject/g' {} +

# Replace placeholders (Linux)
find /path/to/your-project/Brain/ /path/to/your-project/.agents/ \
  -name "*.md" -exec sed -i 's/{{PROJECT_NAME}}/YourProject/g' {} +
```

---

## 2. Configuration & Initialization

Now that the files are in your project, **let the AI do the heavy lifting.**

Open your AI coding assistant (Cursor, Windsurf, Claude Code, Cline, etc.) at the root of your project, and send **one** of the following prompts:

### Option A: The Project ALREADY EXISTS
> "start novo brain - Projeto existente"

**What the AI will do:**
1. Deeply analyze your current codebase.
2. Auto-fill `Brain/PROJECT_CORE.md`, `ARCHITECTURE_DEEP_REVIEW.md`, and others with your actual stack and patterns.
3. Hook up the `.agents/skills/` skills to your specific context.

### Option B: The Project is NEW (Empty)
> "start novo brain - Projeto zerado"

**What the AI will do:**
1. Ask you a series of strategic questions about your goal.
2. Draft the `Brain/PROJECT_CORE.md` and propose a `TECHNICAL_SPEC.md`.
3. Guide you through setting up the initial scaffolding.

---

### Manual Refinements (Optional)

After the AI runs its initialization, you may want to manually tweak:

*   **Workflow:** Open `.agents/workflows/global-workflow.md` and replace the example commands with your actual dev setup (e.g., `npm run dev`).
*   **Engineering Laws:** Open `.agents/rules/engineering-laws.md` and remove any laws that don't apply to your stack.

---

## 3. Git Configuration

Add to your `.gitignore` if needed:

```gitignore
# Brain files you may want to keep private
# Brain/STATUS_REPORT.md
# Brain/RISKS_ISSUES.md
```

> **Recommendation:** Commit `Brain/` and `.agents/` to Git. The whole team benefits from shared project context. Only exclude files with sensitive information.

---

## 4. Onboarding Checklist

Share this checklist with new team members:

### For Developers

- [ ] Read `Brain/PROJECT_CORE.md` — understand scope and stack
- [ ] Read `Brain/TECHNICAL_SPEC.md` — understand architecture
- [ ] Read `.agents/rules/engineering-laws.md` — understand coding standards
- [ ] Check `Brain/ACTIVE_TASKS.md` — see current sprint status
- [ ] Run the workflow in `.agents/workflows/global-workflow.md` — set up local env

### For Tech Leads

- [ ] Review and customize `Brain/ARCHITECTURE_DEEP_REVIEW.md`
- [ ] Review and update `Brain/DECISION_LOG.md` with existing decisions
- [ ] Configure skill routing in `.agents/rules/universal-agent-rules.md`
- [ ] Create domain-specific skills for your project in `.agents/skills/`

### For Product / Stakeholders

- [ ] Review `Brain/PROJECT_CORE.md` — validate scope and goals
- [ ] Review `Brain/ROADMAP_SPRINTS.md` — validate phases and timeline
- [ ] Set success metrics in `Brain/PROJECT_CORE.md`

---

## 5. Day-to-Day Usage

### Rule: Keep Brain Updated

The AI reads Brain docs for context. **Outdated Brain = bad AI output.**

| When This Happens... | Update This File |
|----------------------|-----------------|
| Task started or finished | `ACTIVE_TASKS.md` |
| Architecture decision made | `DECISION_LOG.md` |
| Major refactor completed | `ARCHITECTURE_DEEP_REVIEW.md` |
| Sprint completed | `ROADMAP_SPRINTS.md` + `STATUS_REPORT.md` |
| New risk identified | `RISKS_ISSUES.md` |
| Design tokens changed | `DESIGN_SYSTEM.md` |

### Tip: Let the AI Update Brain

You can ask the AI to update Brain docs after completing work:

> "Update ACTIVE_TASKS.md to mark T-05 as DONE and add the new task T-06 for auth refactoring."

The orchestrator rules already instruct the AI to do this automatically for code changes.

---

## 6. Troubleshooting

| Problem | Solution |
|---------|----------|
| AI doesn't follow rules | Check that `.agents/rules/*.md` have `trigger: always_on` in frontmatter |
| AI doesn't load skills | Verify the skill routing table in `universal-agent-rules.md` has the correct paths |
| AI gives generic answers | Fill in `PROJECT_CORE.md` and `TECHNICAL_SPEC.md` with real content — the AI needs context |
| AI makes wrong architecture decisions | Add the decision to `DECISION_LOG.md` so it won't repeat the mistake |
| Conflicting AI advice | Check for contradictions between rules and skills — rules take precedence |
