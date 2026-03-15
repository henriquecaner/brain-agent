<div align="center">

# 🧠 Brain + Agent Architecture

**Give your AI real project memory. Build things that actually scale.**

[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](./LICENSE)
[![GitHub stars](https://img.shields.io/github/stars/henriquecaner/brain-agent?style=social)](https://github.com/henriquecaner/brain-agent/stargazers)
[![GitHub issues](https://img.shields.io/github/issues/henriquecaner/brain-agent)](https://github.com/henriquecaner/brain-agent/issues)
[![Last Commit](https://img.shields.io/github/last-commit/henriquecaner/brain-agent)](https://github.com/henriquecaner/brain-agent/commits/main)
[![PRs Welcome](https://img.shields.io/badge/PRs-welcome-brightgreen.svg)](./CONTRIBUTING.md)

<br/>

[Setup Guide](./SETUP_GUIDE.md) · [Customization](./CUSTOMIZATION.md) · [Contributing](./CONTRIBUTING.md) · [Changelog](./CHANGELOG.md)

</div>

---

## Table of Contents

- [The Problem](#-the-problem-ai-amnesia)
- [The Solution](#-the-aha-solution-project-native-memory)
- [Quick Start](#-setup-guide-2-minutes)
- [How It Works](#%EF%B8%8F-how-it-works-the-3-pillars)
- [Contributing](#-contributing)
- [License](#-license)

---

## 🤯 The Problem: AI Amnesia + Zero Standards

You're building with AI — whether you're a vibecoder shipping your first SaaS or a seasoned builder scaling a product. And you've hit **two walls**:

### 🧠 Wall 1: It Forgets Everything
- Every new chat, the AI **starts from scratch**
- It forgets your tech stack, your architecture, your patterns
- You keep copy-pasting the same instructions over and over

### 📏 Wall 2: It Has No Standards
- It hardcodes secrets, skips error handling, writes sloppy code
- It mixes patterns — half your app looks one way, half looks another
- There are **no guardrails** to enforce quality, security, or consistency

**Why?** Because the AI only sees isolated files. It has no "big picture" and no rules to follow. You end up repeating yourself every single time — and even then, nothing guarantees it will actually listen.

It's exhausting — and it doesn't scale.

---

## 💡 The "AHA!" Solution: Project-Native Memory

What if your repository had its own persistent, structured brain?

**Brain + Agent Architecture** is a framework that lives *inside* your Git repository. It gives your AI **persistent project memory** and **specialized agent skills** through the `.agents/` directory structure that tools like [Google Antigravity](https://blog.google/technology/google-labs/google-antigravity/) natively support.

Before the AI writes a single line of code, it automatically reads your project's `Brain` to understand the scope, current tasks, and strict engineering rules.

```text
┌─────────────────────────────────────────────────────────────┐
│                    YOUR PROJECT ROOT                        │
│                                                             │
│  📁 Brain/                   ← Project State & Memory       │
│  │  PROJECT_CORE.md          ← Scope, goals, tech stack     │
│  │  ACTIVE_TASKS.md          ← Task tracker                 │
│  │  ARCHITECTURE_DEEP_REVIEW ← Technical deep dive          │
│  │  ...                                                     │
│                                                             │
│  📁 .agents/                 ← AI Agent Configuration       │
│  │  📁 rules/               ← Universal Laws (always on)    │
│  │  │  universal-agent-rules ← Orchestrator behavior        │
│  │  │  engineering-laws      ← Security & code standards    │
│  │  📁 skills/              ← Specialized AI Skills         │
│  │  │  📁 code-review/      ← On-demand Review skill        │
│  │  │  📁 debugging/        ← On-demand Debug skill         │
│  │  📁 workflows/           ← Step-by-step procedures       │
└─────────────────────────────────────────────────────────────┘
```

**The Result:**
- 📖 **Zero Context Loss:** The AI knows your exact tech stack and architectural decisions — every single chat.
- ⚖️ **Enforced Standards:** Agent rules are **always on** — they run on every interaction, guaranteeing the AI respects your Brain, your security rules, and your architecture. No exceptions.
- 🥷 **Dynamic Skills:** When you ask for help with code review, debugging, or testing, it silently loads the right skill and applies specialized knowledge on demand.

> **Built for [Google Antigravity](https://blog.google/technology/google-labs/google-antigravity/)** — leveraging native support for `.agents/rules/`, `.agents/skills/`, and `.agents/workflows/`.

---

## 🚀 Setup Guide (2 Minutes)

Get your AI up to speed instantly.

### Step 1: Add to your project
You can either run the automated setup or copy the folders manually.

**Automated Setup:**
```bash
# Clone this template, then run:
git clone https://github.com/henriquecaner/brain-agent.git
cd brain-agent
chmod +x setup.sh
./setup.sh
```

**Manual Setup:**
Copy the `Brain/` and `.agents/` folders directly to your project root.

### Step 2: Initialize the Brain (Required!)
Once the folders are in your root, open **Antigravity** in your project and paste **ONE** of the following prompts to let the AI initialize its own Brain:

**🪄 Option A: If adding to an EXISTING Project**
> "Initialize Brain — this is an existing project. Deeply analyze the codebase and fill all Brain documents with the real architecture, stack, and patterns."

**🪄 Option B: If starting a BRAND NEW Project**
> "Initialize Brain — this is a new project. Act as a Tech Lead: ask me strategic questions to define scope, tech stack, and goals before scaffolding anything."

---

## ⚙️ How It Works (The 3 Pillars)

### 1. 🧠 The Brain (`/Brain/`)
**The concept:** AI assistants suffer from amnesia — they drop context over long chats. The `/Brain/` directory acts as a permanent memory bank that the AI reads *before* acting.

The single source of truth for Project State. The AI reads this to know *what* we are building and *why*.
- `PROJECT_CORE.md` — The exact tech stack and end goals. (Prevents the AI from suggesting Python in a TS repository).
- `ACTIVE_TASKS.md` — Current tasks. The AI updates this as it finishes work, so you never lose track of what's next.
- `ARCHITECTURE_DEEP_REVIEW.md` — The technical truth. The AI uses this to avoid breaking existing patterns.

### 2. ⚖️ The Laws (`/.agents/rules/`) — Always On
These are the **guardrails**. Unlike skills (which are on-demand), rules are **always active** — Antigravity loads them on every single interaction. This is what guarantees the AI will always read the Brain, follow your standards, and never go rogue.

- `engineering-laws.md` — Enforces security boundaries, async rules, clean architecture, and testing standards. The AI **cannot** skip these.
- `universal-agent-rules.md` — The "Orchestrator" that forces the AI to read the Brain before acting, and routes it to the right skills based on what you're asking.

> **This is the key insight:** The Brain holds the knowledge, but the Rules are what **enforce** it. Without always-on rules, the AI could simply ignore the Brain. With them, it can't.

### 3. 🎯 Agent Skills (`/.agents/skills/<skill>/`)
**The concept:** You can't put *every* rule in the main prompt, or the AI gets confused and slow. Skills solve this through **dynamic routing**.

Agent Skills are **specialized, hyper-focused knowledge loaded strictly on-demand**.
If you ask the AI to "fix the padding on the login button", it detects the "frontend" domain, silently reads `.agents/skills/frontend-design/SKILL.md` (where you define your Design System rules), and applies them perfectly.

Instead of one generic AI, you get a team of specialized experts (UI, Database, Security) that only activate when you need them.

---

## 🤝 Contributing

Contributions are welcome! Whether you're a vibecoder, a builder, or a traditional developer — we'd love your input. Please read the [Contributing Guide](./CONTRIBUTING.md) and the [Code of Conduct](./CODE_OF_CONDUCT.md) before submitting a PR.

---

## 📚 Documentation

| Document | Description |
|----------|-------------|
| [Setup Guide](./SETUP_GUIDE.md) | Detailed installation & onboarding |
| [Customization](./CUSTOMIZATION.md) | Create custom skills, rules, and workflows |
| [Contributing](./CONTRIBUTING.md) | How to contribute to this project |
| [Changelog](./CHANGELOG.md) | Version history and release notes |

---

## 📄 License

This project is licensed under the [MIT License](./LICENSE).
