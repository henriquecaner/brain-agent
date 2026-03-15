# 🎨 Customization Guide

> How to extend the Brain + Agent architecture for your specific project needs.

---

## 1. Creating New Skills

Skills are domain-specific knowledge modules that the AI loads on-demand.

### Step 1: Copy the Template

```bash
cp -r .agents/skills/_template/ .agents/skills/your-skill-name/
```

### Step 2: Edit SKILL.md

```markdown
---
name: your-skill-name
description: Short description of when to use this skill. Keywords help routing.
version: 1.0.0
author: Your Name
---

# Role: [Skill Name]

> **Purpose:** One sentence defining the value.

---

## 1. CONTEXT PROTOCOL (Read First)
Before executing, you MUST read/verify:
1.  **File A:** `path/to/relevant/file`
2.  **File B:** `path/to/other/file`

---

## 2. CORE DIRECTIVES (The Rules)
*   **Rule 1:** What the AI must always do in this domain.
*   **Rule 2:** What the AI must never do.
*   **Rule 3:** Quality standards for this domain.

---

## 3. EXECUTION WORKFLOW
1.  **Step 1:** First action.
2.  **Step 2:** Second action.
3.  **Step 3:** Third action.

---

## 4. ANTI-PATTERNS (What to Avoid)
*   ⛔ **Don't:** Common mistake #1
*   ⛔ **Don't:** Common mistake #2
```

### Step 3: Register the Skill

Add a row to the skill routing table in `.agents/rules/universal-agent-rules.md`:

```markdown
| **Your Domain Keywords** | `.agents/skills/your-skill-name/SKILL.md` | Description of skill. |
```

### Advanced: Adding References

For complex skills, add a `references/` directory:

```
.agents/skills/your-skill-name/
├── SKILL.md
└── references/
    ├── errors.md        # Common errors and fixes
    ├── examples.md      # Code examples
    └── patterns.md      # Architectural patterns
```

Reference these files from your SKILL.md: *"See `references/errors.md` for common error codes."*

---

## 2. Creating New Rules

Rules in `.agents/rules/` are **always active** — they apply to every AI interaction.

### When to Create a Rule (vs. a Skill)

| Use a **Rule** when... | Use a **Skill** when... |
|------------------------|------------------------|
| It applies to ALL code | It applies to a specific domain |
| It's a universal standard | It's specialized knowledge |
| Breaking it is always wrong | It's guidance, not a law |
| Examples: security, naming, testing | Examples: billing, frontend, i18n |

### Rule Format

```markdown
---
trigger: always_on
---

# Rule Title

## 🔒 LAW: Category Name
**Goal:** One sentence describing what this law protects.

* **Directive 1:** Specific, actionable rule.
* **Directive 2:** Another specific rule.
* **Directive 3:** Include the "why" when non-obvious.
```

### Tips for Effective Rules

1. **Be specific** — "Never use `eval()`" > "Avoid unsafe code"
2. **Include the why** — "Use prepared statements to prevent SQL injection"
3. **Make them testable** — Can you verify compliance? If not, make it more concrete
4. **Keep them short** — Long rules get ignored. Aim for 3-5 bullets per section

---

## 3. Creating Workflows

Workflows are step-by-step procedures triggered by slash commands.

### Format

```markdown
---
description: What this workflow does
---

# Workflow Name

## Quick Start

\```bash
# Step 1: Description
command-here

# Step 2: Description
another-command
\```

## Common Commands

| Command | Description |
|---------|-------------|
| `cmd1` | What it does |
| `cmd2` | What it does |

## Notes

- Important caveat 1
- Important caveat 2
```

### Turbo Annotations

Add `// turbo` above a step to let the AI auto-run it without user approval:

```markdown
1. Check git status
// turbo
2. Run the linter
3. Deploy to staging
```

Add `// turbo-all` anywhere to auto-run ALL steps.

### Registering Workflows

Workflows in `.agents/workflows/` are auto-discovered. The filename becomes the slash command:

- `.agents/workflows/deploy.md` → `/deploy`
- `.agents/workflows/test-suite.md` → `/test-suite`

---

## 4. Expanding Brain Documents

### Adding New Brain Docs

1. Create the markdown file in `Brain/`:
   ```bash
   touch Brain/YOUR_NEW_DOC.md
   ```

2. Register it in `.agents/rules/universal-agent-rules.md` (Context Protocol table):
   ```markdown
   | **@YOUR_DOC** | `/Brain/YOUR_NEW_DOC.md` | **[PRIORITY]** Purpose description. |
   ```

### Common Additions by Project Type

| Project Type | Recommended Brain Docs |
|-------------|----------------------|
| **SaaS** | `AI_GOVERNANCE.md`, `FINOPS_STRATEGY.md`, `GTM_STRATEGY.md` |
| **Mobile App** | `PLATFORM_NOTES.md` (iOS/Android specifics), `RELEASE_PROCESS.md` |
| **API / Backend** | `API_CONTRACTS.md`, `DATA_MODEL.md`, `MIGRATION_LOG.md` |
| **Open Source** | `CONTRIBUTING.md`, `CHANGELOG.md`, `VERSIONING.md` |
| **Enterprise** | `COMPLIANCE.md`, `AUDIT_LOG.md`, `SLA_DEFINITIONS.md` |

### Brain Doc Template

```markdown
# DOCUMENT_NAME: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD | **Status:** [ACTIVE]

---

## 1. Overview
Brief description of what this document tracks.

---

## 2. Current State
Tables, lists, or prose describing the current state.

---

## 3. History / Log
Chronological record of changes (if applicable).

---

## 4. Related Documents
Links to other Brain docs or external resources.
```

---

## 5. Skill Ideas by Domain

Need inspiration? Here are skills that work well across many projects:

| Skill Name | Keywords | What It Does |
|-----------|----------|-------------|
| `frontend-design` | UI, CSS, React, Vue | Design system rules, component patterns |
| `api-design` | REST, GraphQL, endpoint | API conventions, response formats |
| `database` | SQL, migration, schema | Query patterns, indexing, migrations |
| `testing` | test, spec, coverage | Test patterns, mocking strategies |
| `deployment` | deploy, CI/CD, release | Deploy procedures, rollback plans |
| `security` | auth, CORS, injection | Security checklists, threat models |
| `performance` | slow, optimize, cache | Profiling guides, caching strategies |
| `i18n` | translate, locale, i18n | Localization rules, string management |
| `billing` | payment, subscription | Payment integration patterns |
| `onboarding` | setup, install, config | New developer setup guides |
