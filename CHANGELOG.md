# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-03-15

### Added
- 🚀 **`install.sh`** — Non-interactive install script, safe to pipe from `curl`. Copies only `Brain/` and `.agents/` to project root
- 🛡️ **Self-detection guard** — Install script blocks execution if run from inside the template repo itself
- 🛡️ **Overwrite protection** — Install script aborts if `Brain/` or `.agents/` already exist
- 🔄 **Post-execution sync workflow** — `.agents/workflows/post-execution-sync.md` auto-syncs Brain docs after complex tasks
- 📊 **Architecture diagram** — Mermaid flowchart in README showing the full task lifecycle

### Changed
- 📖 **README.md** — Complete rewrite: simplified install (curl one-liner), clear Antigravity-only initialization with `⚠️ CAUTION` alert, day-to-day usage section
- ⚖️ **universal-agent-rules.md** — Added Step 7 (Sync) to "Do Work" loop and routing entry for post-execution-sync

### Removed
- 🗑️ **`setup.sh`** — Replaced by `install.sh`. Interactive setup caused installation path bugs
- 🗑️ **`SETUP_GUIDE.md`** — Content merged into README to reduce confusion

## [1.0.0] - 2026-03-15

### Added
- 🧠 **Brain templates** — 9 project-state documents (`PROJECT_CORE`, `ACTIVE_TASKS`, `ARCHITECTURE_DEEP_REVIEW`, etc.)
- ⚖️ **Agent rules** — `universal-agent-rules.md` (orchestrator) and `engineering-laws.md` (security & standards), loaded automatically by Antigravity
- 🎯 **Agent skills** — Template system with `code-review`, `create-plan`, `debugging`, and `testing` skills
- 🔧 **Setup script** — Interactive `setup.sh` with cross-platform support (macOS/Linux)
- 📜 **Utility scripts** — `bin/create-skill.sh` for scaffolding new skills
- 📖 **Documentation** — `README.md`, `SETUP_GUIDE.md`, `CUSTOMIZATION.md`
- 🤖 **Workflow system** — Global development workflow template
