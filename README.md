# 🧠 Brain + Agent Architecture

> Transform your AI from a forgetful junior dev into a Senior Tech Lead who knows your project inside out.

---

## 🤯 The Problem: AI Amnesia

You know the drill. You open Cursor, Windsurf, or Copilot, give it a task, and it confidently writes code that:
- Breaks your architecture
- Ignores your styling conventions
- Uses deprecated libraries
- Forgets the context of the previous chat

**Why?** Because the AI only sees isolated files. It lacks the "big picture". You end up pasting massive system prompts every single time: *"Use React Server Components, don't use standard `<a>` tags, remember we use a custom auth wrapper..."* 

It's exhausting. 

---

## 💡 The "AHA!" Solution: Project-Native Memory

What if your repository had its own persistent, structured brain? 

**Brain + Agent Architecture** is a framework that lives *inside* your Git repository. It gives your AI coding assistants **persistent project memory** and **specialized agent skills**.

Before the AI writes a single line of code, it automatically reads your project's `Brain` to understand the scope, current sprint tasks, and strict engineering laws.

```text
┌─────────────────────────────────────────────────────────────┐
│                    YOUR PROJECT ROOT                        │
│                                                             │
│  📁 Brain/                   ← Project State & Memory       │
│  │  PROJECT_CORE.md          ← Scope, goals, tech stack     │
│  │  ACTIVE_TASKS.md          ← Sprint tracker               │
│  │  ARCHITECTURE_DEEP_REVIEW ← Technical deep dive          │
│  │  ...                                                     │
│                                                             │
│  📁 .agents/                 ← AI Agent Configuration       │
│  │  📁 rules/               ← Universal Laws (always on)    │
│  │  │  universal-agent-rules ← Orchestrator behavior        │
│  │  │  engineering-laws      ← Security & code standards    │
│  │  📁 skills/              ← Specialized AI Skills         │
│  │  │  📁 frontend-design/  ← On-demand UI skill            │
│  │  │  📁 debugging/        ← On-demand Debug skill         │
└─────────────────────────────────────────────────────────────┘
```

**The Result:** 
- 📖 **Zero Context Loss:** The AI knows your exact tech stack and architectural decisions.
- ⚖️ **Strict Compliance:** It reads and obeys your `engineering-laws` (no more hardcoded secrets or sloppy error handling).
- 🥷 **Dynamic Skills (Matrix-style):** When you ask for UI help, it silently loads the `frontend-design` skill to understand your exact design system before acting. 

---

## 🚀 Setup Guide (2 Minutes)

Get your AI up to speed instantly.

### Step 1: Add to your project
You can either run the automated setup or copy the folders manually.

**Automated Setup:**
```bash
# Clone or download this template somewhere, then run:
cp -r brain-agent-template/ /path/to/your-project/
cd /path/to/your-project/brain-agent-template
chmod +x setup.sh
./setup.sh
# The script will handle moving folders and renaming placeholders.
```

**Manual Setup:**
Copy the `Brain/` and `.agents/` folders directly to your project root.

### Step 2: The "Magic Prompts" (Required!)
Once the folders are in your root, open your AI Assistant (Cursor, Windsurf, Cline, etc.) and paste **ONE** of the following magic prompts to let the AI initialize its own Brain:

**🪄 Option A: If adding to an EXISTING Project**
> "start novo brain - Projeto existente"
> *(The AI will deeply analyze your entire codebase and automatically fill the Brain with ultra-specific context about your architecture, stack, and patterns.)*

**🪄 Option B: If starting a BRAND NEW Project**
> "start novo brain - Projeto zerado"
> *(The AI will assume a Tech Lead role, asking you strategic questions to define the scope, tech stack, and initial scaffolding before writing code.)*

---

## ⚙️ How It Works (The 3 Pillars)

### 1. 🧠 The Brain (`/Brain/`)
**The concept:** Large Language Models (like Claude or GPT-4) suffer from amnesia. They drop context over long chats. The `/Brain/` directory acts as a permanent, static memory bank that the AI reads *before* acting.

The single source of truth for Project State. The AI reads this to know *what* we are doing and *why*.
- `PROJECT_CORE.md` — The exact tech stack and end goals. (Prevents the AI from suggesting Python in a TS repository).
- `ACTIVE_TASKS.md` — The current sprint. The AI updates this as it finishes tasks, so you never lose track of what's next.
- `ARCHITECTURE_DEEP_REVIEW.md` — The technical truth. The AI uses this to avoid breaking existing patterns.

### 2. ⚖️ The Laws (`/.agents/rules/`)
Universal rules the AI *must* always follow. 
- `engineering-laws.md` — Enforces security boundaries, async rules, and clean architecture.
- `universal-agent-rules.md` — The "Orchestrator" that tells the AI *how to behave* and when to load specific skills.

### 3. 🎯 Agent Skills (`/.agents/skills/<skill>/`)
**The concept:** You can't put *every* rule in the main prompt, or the AI gets confused and slow. Skills solve this through **dynamic routing**.

You wouldn't ask a DBA to write CSS. Agent Skills are **specialized, hyper-focused knowledge loaded strictly on-demand**. 
If you ask the AI to "fix the padding on the login button", it detects the "frontend" domain, silently reads `.agents/skills/frontend-design/SKILL.md` (where you define your Design System rules), and applies them perfectly mapping to your Tailwind or CSS Modules.

Instead of one generic AI, you get a fleet of specialized experts (UI, Database, Security) that only wake up when you need them.

---

## 🔗 Next Steps
- **[SETUP_GUIDE.md](./SETUP_GUIDE.md)** — Detailed installation & team onboarding checklist.
- **[CUSTOMIZATION.md](./CUSTOMIZATION.md)** — How to create custom skills, rules, and workflows for your company.

---

**License:** MIT — Use freely to build better software, faster.
