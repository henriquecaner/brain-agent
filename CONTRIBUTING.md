# Contributing to Brain + Agent Architecture

First off, thank you for considering contributing! 🎉

Whether you're a vibecoder, a builder, or a seasoned engineer — your contributions make this project better for everyone.

## How to Contribute

### 🐛 Reporting Bugs

1. Check [existing issues](../../issues) to avoid duplicates
2. Use the **Bug Report** template when creating a new issue
3. Include steps to reproduce, expected vs actual behavior

### 💡 Suggesting Features

1. Check [existing issues](../../issues) for similar ideas
2. Use the **Feature Request** template
3. Explain the use case and expected benefit

### 🔧 Submitting Changes

1. **Fork** the repository
2. Create a **feature branch** from `main`:
   ```bash
   git checkout -b feat/your-feature-name
   ```
3. Make your changes following the conventions below
4. **Commit** using [Conventional Commits](https://www.conventionalcommits.org/):
   ```
   feat: add new debugging skill
   fix: correct placeholder replacement on Linux
   docs: improve setup instructions
   ```
5. **Push** and open a **Pull Request** against `main`

### 📝 Conventions

- **Language:** All code, comments, and documentation in **English**
- **Formatting:** 2-space indentation, UTF-8, LF line endings (see `.editorconfig`)
- **Markdown:** Use proper heading hierarchy (`#` → `##` → `###`)
- **Shell scripts:** Use `set -e`, add comments for non-obvious logic

### 📁 Project Structure

```
.specs/          → Project state & memory (spec templates)
  project/       → Stack, architecture, state, conventions, roadmap
  features/      → Feature-level specs, designs, and tasks
.agents/
  rules/         → Universal AI rules (loaded automatically by Antigravity)
  skills/        → Specialized AI skills (each in its own folder)
  workflows/     → Step-by-step procedures (triggered by slash commands)
bin/             → Utility scripts
```

### ✅ Before Submitting

- [ ] Changes follow the project conventions
- [ ] New skills include a `SKILL.md` with proper frontmatter
- [ ] Documentation is updated if behavior changes
- [ ] Shell scripts are tested on both macOS and Linux

## Questions?

Open a [Discussion](../../discussions) or an [Issue](../../issues) — we're happy to help!
