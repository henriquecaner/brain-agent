---
type: brain-document
category: visual-design
---

# DESIGN SYSTEM: {{PROJECT_NAME}}
**Last Updated:** YYYY-MM-DD

> **AI CONTEXT:** This document defines the source of truth for all visual elements, including typography, colors, and spatial systems (padding/margins). Adhere strictly to these tokens when generating UI code.

> Visual design tokens and component guidelines. The AI must consult this before any UI work.

---

## 1. Design Philosophy

<!-- Define your visual identity in 3-5 words -->
**Identity:** [e.g., "Ultra-modern, Calm, Tactile"]

### Principles
1. **[Principle 1]:** e.g., "White space is a feature, not waste"
2. **[Principle 2]:** e.g., "Micro-interactions over static states"
3. **[Principle 3]:** e.g., "Accessibility is non-negotiable"

---

## 2. Color Palette

### Brand Colors
| Token | Value | Usage |
|-------|-------|-------|
| `--color-primary` | `[#hex]` | Primary actions, CTAs |
| `--color-secondary` | `[#hex]` | Secondary elements |
| `--color-accent` | `[#hex]` | Highlights, badges |

### Neutrals
| Token | Value | Usage |
|-------|-------|-------|
| `--color-bg` | `[#hex]` | Page background |
| `--color-surface` | `[#hex]` | Card/container background |
| `--color-border` | `[#hex]` | Borders, dividers |
| `--color-text` | `[#hex]` | Primary text |
| `--color-text-muted` | `[#hex]` | Secondary text |

### Semantic Colors
| Token | Value | Usage |
|-------|-------|-------|
| `--color-success` | `[#hex]` | Success states |
| `--color-warning` | `[#hex]` | Warning states |
| `--color-error` | `[#hex]` | Error states |
| `--color-info` | `[#hex]` | Informational states |

---

## 3. Typography

### Font Stack
```css
--font-heading: '[Font Name]', sans-serif;
--font-body: '[Font Name]', sans-serif;
--font-mono: '[Font Name]', monospace;
```

### Scale
| Token | Size | Weight | Usage |
|-------|------|--------|-------|
| `--text-h1` | 2.5rem | 700 | Page titles |
| `--text-h2` | 2rem | 600 | Section headers |
| `--text-h3` | 1.5rem | 600 | Subsections |
| `--text-body` | 1rem | 400 | Body text |
| `--text-small` | 0.875rem | 400 | Captions, labels |
| `--text-xs` | 0.75rem | 400 | Fine print |

---

## 4. Spacing

### Scale
```
--space-1:  0.25rem   (4px)
--space-2:  0.5rem    (8px)
--space-3:  0.75rem   (12px)
--space-4:  1rem      (16px)
--space-5:  1.5rem    (24px)
--space-6:  2rem      (32px)
--space-8:  3rem      (48px)
--space-10: 4rem      (64px)
--space-12: 6rem      (96px)
```

### Container
```
--container-max: 1200px;
--container-padding: var(--space-4);
```

---

## 5. Borders & Shadows

### Border Radius
```
--radius-sm:  0.25rem
--radius-md:  0.5rem
--radius-lg:  0.75rem
--radius-xl:  1rem
--radius-full: 9999px
```

### Shadows
```
--shadow-sm:  0 1px 2px rgba(0,0,0,0.05);
--shadow-md:  0 4px 6px rgba(0,0,0,0.07);
--shadow-lg:  0 10px 15px rgba(0,0,0,0.1);
--shadow-xl:  0 20px 25px rgba(0,0,0,0.1);
```

---

## 6. Motion & Animation

### Durations
```
--duration-fast:   150ms
--duration-normal: 300ms
--duration-slow:   500ms
```

### Easings
```
--ease-default: cubic-bezier(0.4, 0, 0.2, 1);
--ease-in:      cubic-bezier(0.4, 0, 1, 1);
--ease-out:     cubic-bezier(0, 0, 0.2, 1);
--ease-spring:  cubic-bezier(0.34, 1.56, 0.64, 1);
```

### Rules
- **Hover effects:** `var(--duration-fast)` with `var(--ease-default)`
- **Page transitions:** `var(--duration-normal)` with `var(--ease-out)`
- **Loading states:** `var(--duration-slow)` with `var(--ease-default)`
- **Respect `prefers-reduced-motion`** — disable animations when requested

---

## 7. Component Guidelines

### Buttons
| Variant | Background | Text | Border |
|---------|-----------|------|--------|
| Primary | `--color-primary` | `white` | none |
| Secondary | transparent | `--color-primary` | `--color-primary` |
| Ghost | transparent | `--color-text` | none |
| Destructive | `--color-error` | `white` | none |

### Cards
- Background: `--color-surface`
- Border: `1px solid --color-border`
- Radius: `--radius-lg`
- Shadow: `--shadow-md`
- Padding: `--space-5`

### Inputs
- Height: `2.5rem` (40px)
- Border: `1px solid --color-border`
- Focus ring: `2px solid --color-primary`
- Radius: `--radius-md`
- Padding: `0 --space-3`

---

## 8. Responsive Breakpoints

```
--bp-sm:  640px    # Mobile landscape
--bp-md:  768px    # Tablet
--bp-lg:  1024px   # Desktop
--bp-xl:  1280px   # Large desktop
--bp-2xl: 1536px   # Ultra-wide
```

### Strategy
- **Mobile-first** — base styles for mobile, media queries for larger screens
- **Max width:** `--container-max` centered with auto margins
