# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [2.0.0] - 2026-04-01

### ⚠️ BREAKING CHANGES

The internal memory system has been completely restructured. The `Brain/` directory has been replaced by `.specs/` — a cleaner, more modular specification-driven architecture.

**Migration required:** See [UPGRADE.md](./UPGRADE.md) for step-by-step instructions.

### Added
- 📁 **`.specs/project/` directory** — 5 spec templates replacing the 9 Brain templates:
  - `STACK.md` — Scope, goals, tech stack (replaces `PROJECT_CORE.md`)
  - `ARCHITECTURE.md` — Technical deep dive (replaces `ARCHITECTURE_DEEP_REVIEW.md` + `TECHNICAL_SPEC.md`)
  - `STATE.md` — Decisions, blockers, risks, lessons (replaces `DECISION_LOG.md` + `RISKS_ISSUES.md` + `STATUS_REPORT.md`)
  - `CONVENTIONS.md` — Coding rules & patterns (replaces `DESIGN_SYSTEM.md`)
  - `ROADMAP.md` — Milestones & timeline (replaces `ROADMAP_SPRINTS.md`)
- 📁 **`.specs/features/` directory** — Feature-level specs with `spec.md`, `design.md`, `context.md`, and `tasks.md` per feature
- 🧠 **Brain skill** — Complete planning & execution orchestrator with 16 reference sub-skills (specify, design, tasks, implement, validate, quick-mode, discuss, session-handoff, etc.)
- 🔄 **Auto-sizing execution** — Pipeline adapts complexity: Specify + Execute always required; Design and Tasks skipped when unnecessary
- 🎯 **Testing skill routing** — `testing/SKILL.md` now registered in the Dynamic Skill Loading table

### Changed
- 📖 **README.md** — Complete rewrite reflecting `.specs/` architecture, updated diagrams, prompts, and day-to-day usage table
- 📖 **CUSTOMIZATION.md** — Section 4 updated from "Brain Documents" to "Spec Documents"
- 📖 **UPGRADE.md** — Added v1.x → v2.0.0 migration guide with mapping table
- 🛠️ **`install.sh`** — Now copies `.specs/` instead of `Brain/`, updated prompts and output messages
- 🛠️ **`bin/create-skill.sh`** — Fixed bug: `.agent/` (singular) → `.agents/` (plural) in all 5 path references
- ⚖️ **`universal-agent-rules.md`** — Context Protocol table updated to `.specs/` paths, testing skill added to routing
- 🎯 **`code-review/SKILL.md`** — Context Protocol paths updated to `.specs/`
- 🎯 **`debugging/SKILL.md`** — Context Protocol paths updated to `.specs/`
- 🎯 **`testing/SKILL.md`** — Context Protocol paths updated to `.specs/`
- 🔄 **`post-execution-sync.md`** — Description updated from "Brain docs" to "Spec docs"
- 🔄 **`global-workflow.md`** — Task tracking reference updated to `.specs/features/`
- 📚 **`brain/references/`** — All 16 reference files updated: removed references to non-existent skills (`codenavi`, `mermaid-studio`, `Context7 MCP`), fixed incomplete paths, updated file name references

### Removed
- 🗑️ **`Brain/` directory** — All 9 templates replaced by 5 focused `.specs/project/` documents
- 🗑️ **`.skill-lock.json.backup`** — Removed stale install artifact
- 🗑️ **`concerns.md`** — Redundant reference file removed (content consolidated into `STATE.md`)

### Fixed
- 🐛 **`install.sh`** — Was trying to copy non-existent `Brain/` directory, causing installation failure
- 🐛 **`create-skill.sh`** — Used `.agent/` (singular) instead of `.agents/` (plural), making skill creation completely broken
- 🐛 **`context-limits.md`** — Referenced obsolete file names (`ARCHITECTURE_DEEP_REVIEW.md`, `DESIGN_SYSTEM.md`)
- 🐛 **`roadmap.md`** — Incomplete path `/.specs/STACK.md` → `/.specs/project/STACK.md`
- 🐛 **Engineering Laws path** — `testing/SKILL.md` and `code-review/SKILL.md` referenced `.agent/rules/` (singular) instead of `.agents/rules/`

## [1.1.0] - 2026-03-15

### Added
- 🚀 **`install.sh`** — Non-interactive install script, safe to pipe from `curl`. Copies only `.specs/` and `.agents/` to project root
- 🛡️ **Self-detection guard** — Install script blocks execution if run from inside the template repo itself
- 🛡️ **Overwrite protection** — Install script aborts if target directories already exist
- 🔄 **Post-execution sync workflow** — `.agents/workflows/post-execution-sync.md` auto-syncs spec docs after complex tasks
- 📊 **Architecture diagram** — Mermaid flowchart in README showing the full task lifecycle

### Changed
- 📖 **README.md** — Simplified install (curl one-liner), clear Antigravity-only initialization with `⚠️ CAUTION` alert, day-to-day usage section
- ⚖️ **universal-agent-rules.md** — Added Step 7 (Sync) to "Do Work" loop and routing entry for post-execution-sync

### Removed
- 🗑️ **`setup.sh`** — Replaced by `install.sh`. Interactive setup caused installation path bugs
- 🗑️ **`SETUP_GUIDE.md`** — Content merged into README to reduce confusion

## [1.0.0] - 2026-03-15

### Added
- 🧠 **Spec templates** — 5 project-state documents (`STACK`, `ARCHITECTURE`, `STATE`, `CONVENTIONS`, `ROADMAP`)
- ⚖️ **Agent rules** — `universal-agent-rules.md` (orchestrator) and `engineering-laws.md` (security & standards), loaded automatically by Antigravity
- 🎯 **Agent skills** — Template system with `brain`, `code-review`, `debugging`, and `testing` skills
- 🔧 **Setup script** — Non-interactive `install.sh` with cross-platform support (macOS/Linux)
- 📜 **Utility scripts** — `bin/create-skill.sh` for scaffolding new skills
- 📖 **Documentation** — `README.md`, `CUSTOMIZATION.md`, `UPGRADE.md`
- 🤖 **Workflow system** — Global development workflow and post-execution sync
