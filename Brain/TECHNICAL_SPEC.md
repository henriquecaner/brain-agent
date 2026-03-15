---
type: brain-document
category: technical-specification
---

# TECHNICAL SPEC: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD

> **AI CONTEXT:** Concise architecture reference setting the rules for module patterns, API conventions, and paths. For the full deep dive, see [ARCHITECTURE_DEEP_REVIEW.md](./ARCHITECTURE_DEEP_REVIEW.md).

---

## 1. System Architecture

### High-Level Overview
```
[Client] ──REST/GraphQL──▶ [Server] ──ORM──▶ [Database]
                              │
                         [External Services]
```

### Design Principles
1. **[Principle 1]:** e.g., "API-first — all features accessible via REST before UI"
2. **[Principle 2]:** e.g., "Fail-fast — validate at boundaries, crash early"
3. **[Principle 3]:** e.g., "Convention over configuration — follow established patterns"

---

## 2. Directory Structure

```
{{PROJECT_NAME}}/
├── src/                        # Frontend source
│   ├── components/             # Reusable UI components
│   ├── features/               # Feature modules (lazy-loaded)
│   ├── hooks/                  # Custom React hooks
│   ├── lib/                    # Utility libraries
│   └── types/                  # TypeScript type definitions
├── server/                     # Backend source
│   ├── modules/                # Domain modules
│   │   ├── core/               # Core business modules
│   │   ├── platform/           # Infrastructure modules
│   │   └── shared/             # Shared utilities
│   └── middleware/             # Express middleware
├── shared/                     # Code shared between client & server
│   ├── types/                  # Shared TypeScript types
│   └── constants/              # Shared constants
├── Brain/                      # Project state & memory
└── .agents/                    # AI agent configuration
```

---

## 3. Module Pattern

### Backend Modules
```
module-name/
├── module.router.ts        # HTTP layer — validation, auth, response
├── module.service.ts       # Business logic — pure functions
├── module.repository.ts    # Data access — ORM queries only
├── module.types.ts         # Module-specific types
└── module.test.ts          # Unit tests
```

### Rules
- **Routers** handle HTTP concerns only (request parsing, response formatting)
- **Services** contain all business logic (testable without HTTP)
- **Repositories** handle data access only (no business rules)
- Services can call other Services but never Routers
- Repositories are called only by their own Service

---

## 4. API Conventions

### URL Pattern
```
[METHOD] /api/v1/[resource]/[id?]/[action?]
```

### Response Format
```json
{
  "success": true,
  "data": { },
  "error": null,
  "meta": {
    "page": 1,
    "total": 100
  }
}
```

### Error Format
```json
{
  "success": false,
  "data": null,
  "error": {
    "code": "VALIDATION_ERROR",
    "message": "Human-readable message",
    "details": []
  }
}
```

### HTTP Status Codes
| Code | Usage |
|------|-------|
| `200` | Success |
| `201` | Created |
| `400` | Validation error |
| `401` | Not authenticated |
| `403` | Not authorized |
| `404` | Not found |
| `409` | Conflict |
| `422` | Unprocessable entity |
| `500` | Internal server error |

---

## 5. Environment Variables

### Required
| Variable | Purpose | Example |
|----------|---------|---------|
| `DATABASE_URL` | Database connection string | `postgresql://...` |
| `[AUTH_KEY]` | Authentication provider key | `sk_...` |
| `[API_KEY]` | External service API key | `key_...` |

### Optional
| Variable | Default | Purpose |
|----------|---------|---------|
| `PORT` | `3000` | Server port |
| `NODE_ENV` | `development` | Environment |
| `LOG_LEVEL` | `info` | Logging verbosity |

---

## 6. Key Integrations

| Integration | Purpose | Config File |
|-------------|---------|-------------|
| [e.g., Clerk] | Auth | [path] |
| [e.g., Stripe] | Payments | [path] |
| [e.g., Redis] | Caching | [path] |

---

## 7. Performance Targets

| Metric | Target |
|--------|--------|
| API response time (p95) | < 500ms |
| Page load (LCP) | < 2.5s |
| Bundle size (gzipped) | < 200KB |
| Database query time | < 100ms |
