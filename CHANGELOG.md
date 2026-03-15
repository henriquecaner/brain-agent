# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.1.0] - 2026-03-15

### Added
- 🔄 **Post-execution sync workflow** — `.agents/workflows/post-execution-sync.md` automatically analyzes changes and updates Brain docs & Skills after complex tasks
- 📊 **Architecture diagram** — Mermaid flowchart in README showing the full task lifecycle including the sync loop

### Changed
- 📖 **README.md** — Upgraded from "3 Pillars" to "4 Pillars" with new Workflows section, updated directory tree
- 📖 **SETUP_GUIDE.md** — Added workflows to mental model, onboarding checklist, day-to-day usage, and troubleshooting
- 📖 **CUSTOMIZATION.md** — Updated workflows section with post-execution-sync reference and registration tip
- 🔧 **setup.sh** — Granular copy output now lists rules/skills/workflows separately, added sync workflow to next-steps
- ⚖️ **universal-agent-rules.md** — Added Step 7 (Sync) to "Do Work" loop and routing entry for post-execution-sync

## [1.0.0] - 2026-03-15

### Added
- 🧠 **Brain templates** — 9 project-state documents (`PROJECT_CORE`, `ACTIVE_TASKS`, `ARCHITECTURE_DEEP_REVIEW`, etc.)
- ⚖️ **Agent rules** — `universal-agent-rules.md` (orchestrator) and `engineering-laws.md` (security & standards), loaded automatically by Antigravity
- 🎯 **Agent skills** — Template system with `code-review`, `create-plan`, `debugging`, and `testing` skills
- 🔧 **Setup script** — Interactive `setup.sh` with cross-platform support (macOS/Linux)
- 📜 **Utility scripts** — `bin/create-skill.sh` for scaffolding new skills
- 📖 **Documentation** — `README.md`, `SETUP_GUIDE.md`, `CUSTOMIZATION.md`
- 🤖 **Workflow system** — Global development workflow template
