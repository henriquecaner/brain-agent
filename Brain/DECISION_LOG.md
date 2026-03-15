---
type: brain-document
category: architecture-decisions
---

# DECISION LOG (ADR): {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD

> **AI CONTEXT:** This log tracks all major architectural, framework, and design decisions. Check this log to avoid reverting or contradicting agreed-upon patterns.

> Records all architectural and technology decisions that have >10% impact on the project.
> Format inspired by [ADR (Architecture Decision Records)](https://adr.github.io/).

---

## How to Use This Log

1. **When to log:** Any decision that changes architecture, stack, patterns, or has broad codebase impact.
2. **Format:** Use the template below. Keep entries concise.
3. **Status:** `ACCEPTED`, `SUPERSEDED` (by DEC-XX), or `DEPRECATED`.

---

## Decision Template

```markdown
### DEC-XXX: [Decision Title] (YYYY-MM-DD)
**Status:** ACCEPTED
**Context:** [Why was this decision needed? What problem are we solving?]
**Decision:** [What we decided to do.]
**Consequences:**
- ✅ [Positive outcome]
- ⚠️ [Trade-off or risk]
**Alternatives Considered:**
- [Option A — why rejected]
- [Option B — why rejected]
```

---

## Decisions

### DEC-001: [Example: Choose React over Vue] (YYYY-MM-DD)
**Status:** ACCEPTED
**Context:** Need a frontend framework with strong ecosystem, TypeScript support, and team familiarity.
**Decision:** Adopt React 19 with Vite as the build tool.
**Consequences:**
- ✅ Team already has React experience — faster onboarding
- ✅ Largest ecosystem of UI libraries and tools
- ⚠️ React 19 is newer — some libraries may not support latest APIs yet
**Alternatives Considered:**
- Vue 3 — smaller community, team less familiar
- Svelte — great DX but smaller ecosystem for enterprise needs

---

### DEC-002: [Example: Use Drizzle ORM over Prisma] (YYYY-MM-DD)
**Status:** ACCEPTED
**Context:** Need a type-safe ORM that works well with serverless deployments and doesn't add heavy bundle size.
**Decision:** Adopt Drizzle ORM for database access.
**Consequences:**
- ✅ Zero runtime overhead — SQL-like syntax compiles to clean queries
- ✅ Excellent TypeScript inference
- ⚠️ Smaller community than Prisma — fewer tutorials and examples
**Alternatives Considered:**
- Prisma — heavier runtime, binary dependency causes issues in serverless
- Raw SQL — no type safety, error-prone

---

<!-- Add new decisions above this line -->
