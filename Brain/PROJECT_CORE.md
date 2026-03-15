---
type: brain-document
category: core-configuration
status: ACTIVE
---

# PROJECT_CORE: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD

> **AI CONTEXT:** This document is the authoritative source of truth for the project's scope, tech stack, and goals. DO NOT guess or hallucinate these details. Always refer to this document.

---

## 1. Objective & Scope

### Mission
<!-- One sentence describing your product/project mission -->
Build a [description of what you're building] for [target audience].

### Value Proposition
- **For:** [Target users/personas]
- **Problem:** [Core problem you're solving]
- **Solution:** [How your product solves it]

### In Scope
| Feature | Status | Description |
|---------|--------|-------------|
| Feature A | ✅ DONE | Brief description |
| Feature B | 🔄 IN PROGRESS | Brief description |
| Feature C | 📋 TODO | Brief description |

### Out of Scope (Future Roadmap)
- Future feature 1
- Future feature 2
- Future feature 3

---

## 2. Tech Stack

### Current Stack

```
┌─────────────────────────────────────────────────────────────┐
│                     FRONTEND                                │
│  [Framework] + [Build Tool] + [Styling]                     │
└───────────────────────────┬─────────────────────────────────┘
                            │ [Protocol]
┌───────────────────────────▼─────────────────────────────────┐
│                     BACKEND                                 │
│  [Runtime] + [Framework] + [ORM] + [Validation]             │
└───────────────────────────┬─────────────────────────────────┘
                            │
        ┌───────────────────┼───────────────────┐
        ▼                   ▼                   ▼
┌───────────────┐   ┌───────────────┐   ┌───────────────┐
│   Database    │   │   External    │   │     Auth      │
│   [Type]      │   │   Services    │   │   [Provider]  │
└───────────────┘   └───────────────┘   └───────────────┘
```

### Key Technologies
| Layer | Technology | Purpose |
|-------|------------|---------|
| Frontend | [e.g., React 19 + Vite] | SPA / SSR |
| Styling | [e.g., TailwindCSS] | Design system |
| State | [e.g., TanStack Query] | Server state |
| Backend | [e.g., Express / Next.js] | API / Server |
| ORM | [e.g., Drizzle / Prisma] | Database access |
| Database | [e.g., PostgreSQL] | Data persistence |
| Auth | [e.g., Clerk / Auth.js] | Authentication |
| Hosting | [e.g., Vercel / AWS] | Infrastructure |
| CI/CD | [e.g., GitHub Actions] | Automation |

---

## 3. Stakeholders & Constraints

### Team
| Role | Name |
|------|------|
| Owner/Lead | [Name] |
| Frontend Dev | [Name] |
| Backend Dev | [Name] |
| Designer | [Name] |

### Constraints
| Type | Constraint |
|------|------------|
| Budget | [e.g., Free tier only / $X/month max] |
| Timeline | [e.g., MVP by Q2 2026] |
| Security | [e.g., SOC2 compliance required] |
| Languages | [e.g., en-US primary] |

---

## 4. Success Metrics

### Product Metrics
| Metric | Target | Current |
|--------|--------|---------|
| [Key metric 1] | [Target] | TBD |
| [Key metric 2] | [Target] | TBD |

### Technical Metrics
| Metric | Target | Status |
|--------|--------|--------|
| API success rate | ≥99% | TBD |
| Page load (LCP) | <2.5s | TBD |
| Test coverage | ≥80% | TBD |

---

## 5. Codebase Metrics

| Metric | Value |
|--------|-------|
| Total files | [X] |
| Total LOC | [~X,000] |
| DB tables | [X] |
| API routes | [X] |
| Test suites | [X] |

---

## 6. Key Decisions Reference
See [DECISION_LOG.md](./DECISION_LOG.md) for full architectural decisions.

---

## 7. Quick Reference

### Local Development
```bash
# Install dependencies
[your install command]

# Start development
[your dev command]

# Run tests
[your test command]
```

### Key Files
| Purpose | Path |
|---------|------|
| Entry point | `[path]` |
| Config | `[path]` |
| Schema | `[path]` |
| Tests | `[path]` |

### Related Brain Documents
| Document | Purpose |
|----------|---------|
| `ARCHITECTURE_DEEP_REVIEW.md` | Complete technical deep dive |
| `TECHNICAL_SPEC.md` | Architecture & directory structure |
| `ACTIVE_TASKS.md` | Sprint task tracker |
| `DECISION_LOG.md` | Architectural decisions |
| `DESIGN_SYSTEM.md` | Visual design language |
| `ROADMAP_SPRINTS.md` | Development phases |
| `RISKS_ISSUES.md` | Risk register |
| `STATUS_REPORT.md` | Latest status report |
