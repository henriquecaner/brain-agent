---
type: brain-document
category: risk-management
---

# RISKS & ISSUES: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD

> **AI CONTEXT:** This register tracks active systemic risks and resolved systemic issues. Update when a critical bug reveals a systemic vulnerability.

---

## Active Risks

| ID | Risk | Impact | Probability | Mitigation | Owner |
|----|------|--------|-------------|------------|-------|
| R-01 | [Example: Third-party API rate limits] | HIGH | MEDIUM | Implement caching + retry with backoff | [Name] |
| R-02 | [Example: Single point of failure in auth] | HIGH | LOW | Add fallback auth mechanism | [Name] |
| R-03 | [Risk description] | [HIGH/MED/LOW] | [HIGH/MED/LOW] | [Mitigation strategy] | [Name] |

---

## Active Issues

| ID | Issue | Severity | Status | Assigned | Notes |
|----|-------|----------|--------|----------|-------|
| I-01 | [Example: Memory leak in long SSE connections] | HIGH | INVESTIGATING | [Name] | Found via monitoring |
| I-02 | [Issue description] | [HIGH/MED/LOW] | [Status] | [Name] | [Notes] |

### Issue Statuses
- `OPEN` — Identified, not yet being worked on
- `INVESTIGATING` — Actively being analyzed
- `IN PROGRESS` — Fix being implemented
- `RESOLVED` — Fixed and verified
- `WONTFIX` — Accepted risk or not applicable

---

## Resolved History

| ID | Risk/Issue | Resolution | Date |
|----|-----------|------------|------|
| R-XX | [Description] | [How it was resolved] | YYYY-MM-DD |

---

## Risk Assessment Matrix

```
                  IMPACT
            Low    Med    High
         ┌──────┬──────┬──────┐
   High  │  🟡  │  🟠  │  🔴  │
Prob Med │  🟢  │  🟡  │  🟠  │
   Low   │  🟢  │  🟢  │  🟡  │
         └──────┴──────┴──────┘

🟢 Accept   🟡 Monitor   🟠 Mitigate   🔴 Critical — Act Now
```
