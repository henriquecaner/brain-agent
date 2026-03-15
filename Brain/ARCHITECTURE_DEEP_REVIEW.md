---
type: brain-document
category: technical-architecture
---

# ARCHITECTURE DEEP REVIEW: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD | **Reviewer:** [Name/Agent]

> **AI CONTEXT:** This is the comprehensive technical reference for the entire codebase. AI agents should **READ THIS FIRST** for any deep technical question or before undertaking major refactoring.

---

## 1. Architecture Overview

### System Diagram
```
<!-- Replace with your actual architecture diagram -->
┌──────────────┐     ┌──────────────┐     ┌──────────────┐
│   Frontend   │────▶│   Backend    │────▶│   Database   │
│              │     │              │     │              │
└──────────────┘     └──────────────┘     └──────────────┘
```

### Architectural Style
<!-- e.g., Monolith, Microservices, Modular Monolith, Serverless -->
[Describe your architectural style and key design principles]

### Key Design Decisions
- **[Decision 1]:** [Brief explanation]
- **[Decision 2]:** [Brief explanation]

---

## 2. Directory Structure

```
project-root/
├── src/                    # [Description]
│   ├── components/         # [Description]
│   ├── pages/              # [Description]
│   ├── services/           # [Description]
│   ├── utils/              # [Description]
│   └── types/              # [Description]
├── server/                 # [Description]
│   ├── routes/             # [Description]
│   ├── services/           # [Description]
│   └── middleware/         # [Description]
├── shared/                 # [Description]
│   └── types/              # [Description]
└── tests/                  # [Description]
```

---

## 3. Database Schema

### Tables Overview
| Table | Rows (est.) | Purpose |
|-------|-------------|---------|
| `users` | — | User accounts |
| `[table_2]` | — | [Purpose] |
| `[table_3]` | — | [Purpose] |

### Key Relationships
```
users 1──▶ N posts
users 1──▶ 1 profile
posts N──▶ N tags (via post_tags)
```

### Security
<!-- e.g., RLS policies, encryption at rest, etc. -->
- [Security measure 1]
- [Security measure 2]

---

## 4. API Routes

### Route Groups
| Prefix | Module | Auth | Description |
|--------|--------|------|-------------|
| `/api/v1/auth` | auth | Public | Authentication endpoints |
| `/api/v1/users` | users | Protected | User management |
| `/api/v1/[resource]` | [module] | [Auth type] | [Description] |

### Middleware Stack
```
Request → [CORS] → [Rate Limit] → [Auth] → [Validation] → Handler → Response
```

---

## 5. Authentication & Authorization

### Auth Provider
<!-- e.g., Clerk, Auth.js, custom JWT -->
- **Provider:** [Name]
- **Strategy:** [JWT / Session / OAuth]
- **Protected Routes:** [How routes are protected]

### User Roles
| Role | Permissions |
|------|------------|
| `user` | [Basic access] |
| `admin` | [Full access] |

---

## 6. External Services & Integrations

| Service | Purpose | SDK/Client |
|---------|---------|-----------|
| [Service 1] | [Purpose] | [How it's integrated] |
| [Service 2] | [Purpose] | [How it's integrated] |

---

## 7. Security Measures

### Implemented
- [ ] Input validation (Zod / Joi)
- [ ] SQL injection prevention (ORM)
- [ ] XSS protection (sanitization)
- [ ] CSRF protection
- [ ] Rate limiting
- [ ] CORS configuration
- [ ] Security headers (CSP, HSTS)
- [ ] Secrets management (.env)

### Pending
- [ ] [Security item to implement]

---

## 8. Testing Strategy

### Test Types
| Type | Framework | Coverage | Location |
|------|-----------|----------|----------|
| Unit | [e.g., Vitest] | [X]% | `**/*.test.ts` |
| Integration | [e.g., Supertest] | [X]% | `tests/integration/` |
| E2E | [e.g., Playwright] | [X]% | `tests/e2e/` |

### Running Tests
```bash
# All tests
[command]

# Watch mode
[command]

# Coverage report
[command]
```

---

## 9. CI/CD Pipeline

### Pipeline Stages
```
Push → Lint → Type Check → Test → Build → Deploy
```

### Configuration
- **CI:** [e.g., GitHub Actions — `.github/workflows/ci.yml`]
- **CD:** [e.g., Vercel auto-deploy on main]

---

## 10. Performance Considerations

### Caching
- [Cache strategy 1]
- [Cache strategy 2]

### Optimization
- [Optimization 1]
- [Optimization 2]

---

## 11. Known Issues & Technical Debt

| ID | Issue | Impact | Priority |
|----|-------|--------|----------|
| TD-01 | [Description] | [Impact] | [Priority] |

---

## 12. Code Conventions

### Naming
| Type | Convention | Example |
|------|-----------|---------|
| Files | [kebab-case / PascalCase] | `user-service.ts` |
| Functions | [camelCase] | `getUserById()` |
| Types | [PascalCase] | `UserProfile` |
| Constants | [SCREAMING_SNAKE] | `MAX_RETRIES` |

### Module Pattern
```
module/
├── *.router.ts       # HTTP layer (validation, auth)
├── *.service.ts      # Business logic
└── *.repository.ts   # Data access
```
