# Reporting Skill — Customer Hub

Generate production-grade HTML reports from customer-hub data. Reports are self-contained, dark-themed, and designed to be shown to managers and leadership.

## Trigger Phrases
- "generate report", "territory report", "territory dashboard"
- "report on [customer]", "deep dive on [customer]", "show me [customer]"
- "weekly report", "weekly activity"
- "who's going cold", "account health"

## How It Works

You are the report engine. You read the customer-hub files, understand the content, and produce a self-contained HTML report. There is no intermediate JSON step, no template engine — you read the data and write the HTML directly.

## Report Types

### 1. Territory Dashboard
A card-grid overview of all customers in the territory.

**Data sources:**
- `customers.md` (root) — health emoji, status, next action per customer
- `cust/*/context/index.md` — engagement tracks, action items, overview
- `cust/*/context/personas.md` — stakeholder names, roles, seniority
- `cust/*/context/competitors.md` — competitive landscape
- `cust/*/context/meeting-notes/*.md` — meeting count, last touch date

**What to extract per customer:**
- **Name** and **health status** (🟢 Active, 🟡 Watch, 🔴 Urgent, ⚪ Cold)
- **Stakeholder count** with key names and their roles
- **Meeting count** and **days since last meeting** (from filenames: `YYYY-MM-DD_*.md`)
- **Engagement tracks** — the active workstreams. These vary per customer: look for sections with "Track", numbered workstreams, or major initiative headers in `index.md`
- **Top action items** (open `- [ ]` checkboxes) — show up to 5, with owner name bolded if present
- **Competitors** — names from `competitors.md` `##` headers
- **Next action** — from `customers.md` table

**Layout:**
- Header with hero stats (total customers, active, at risk, going cold, meetings this month)
- Sticky filter bar with health tabs (All / 🟢 / 🟡 / 🔴 / ⚪) and search box
- Card grid: `repeat(auto-fill, minmax(380px, 1fr))`
- Cards sorted: 🔴 first → 🟡 → 🟢 → ⚪

**Skip:** `sample-customer`, `_internal`, any customer marked INACTIVE in `customers.md`

### 2. Customer Deep Dive
A single-customer report with full context.

**Data sources:** All files in `cust/<slug>/context/`

**Sections:**
1. **Header** — Customer name, health badge, TPID, overview paragraph
2. **Quick Stats** — Meetings, stakeholders, open actions, competitors (horizontal stat cards)
3. **Stakeholders** — Full list grouped by Customer Team / Your Org Team / Partners. Show name, role/title, and a brief note about their relevance. Parse from `personas.md`.
4. **Engagement Tracks** — Active workstreams with status and recent activity
5. **Meeting Timeline** — Reverse chronological list of all meetings with topic summary. Parse from `meeting-notes/` files.
6. **Action Items** — All open items grouped by source/track, with owners
7. **Competitive Landscape** — From `competitors.md`: competitor name, status (embedded/evaluating/piloting), strategy, and key intel
8. **Architecture** — Key highlights from `architecture.md` if it exists

### 3. Weekly Activity
A weekly summary of territory activity.

**Sections:**
- Week date range
- Stats: meetings held, customers touched, new action items
- **Customers Touched** — those with meetings this week, showing topics
- **Going Cold** — accounts with no contact >21 days, sorted by days since last touch
- **Key Action Items Due** — urgent/overdue items across all customers

## Design System

Follow this design system exactly. Reference `references/design-system.html` for the full CSS.

### Colors
| Token | Hex | Usage |
|-------|-----|-------|
| `bg-primary` | `#0d1117` | Page background |
| `bg-card` | `#161b22` | Card background |
| `bg-metrics` | `#0d1117` | Metrics bar inside cards |
| `bg-engagement` | `#1c2128` | Engagement track blocks |
| `border-default` | `#30363d` | Card borders, dividers |
| `border-subtle` | `#21262d` | Inner dividers |
| `text-primary` | `#f0f6fc` | Headings, names, values |
| `text-body` | `#e6edf3` | Body text |
| `text-secondary` | `#8b949e` | Labels, metadata |
| `text-muted` | `#484f58` | TPIDs, timestamps |
| `blue` | `#58a6ff` | Primary accent, links, hover borders |
| `green` | `#3fb950` | Active/healthy status |
| `yellow` | `#d29922` | Warning/watch status |
| `red` | `#f85149` | Urgent/at-risk status |
| `orange` | `#f0883e` | Special accent |

### Typography
- **Font stack:** `-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif`
- **Base:** 14px, line-height 1.5
- **Page title:** 28px, weight 700
- **Card name:** 16px, weight 700
- **Section labels:** 10px, weight 700, uppercase, letter-spacing 1px, color `text-secondary`
- **Metric values:** 15px, weight 700
- **Metric labels:** 10px, uppercase, letter-spacing 0.3px
- **Engagement title:** 13px, weight 600
- **Engagement status:** 12px, color `text-secondary`
- **Action items:** 12px
- **Badges:** 11px, weight 600, pill-shaped (border-radius 20px)

### Card Structure
```
┌──────────────────────────────────────────────┐
│ ● Customer Name                    [Badge]   │ ← card-header (16px 20px padding)
│   TPID 123456                                │    border-bottom: 1px solid #21262d
├──────────────────────────────────────────────┤
│  Meetings │ Stakeholders │ Last Touch        │ ← card-metrics (bg #0d1117, grid 3-col)
│    17     │     30       │   5 days          │    12px 20px padding
├──────────────────────────────────────────────┤
│ ACTIVE TRACKS                                │ ← section-label (10px uppercase)
│ ┌──────────────────────────────────────────┐ │
│ │ Track: Platform Modernization            │ │ ← engagement block (bg #1c2128, 6px radius)
│ │ Status text here...                      │ │
│ └──────────────────────────────────────────┘ │
│                                              │
│ ACTION ITEMS                                 │
│ □ [Owner] Do the thing                       │ ← action-item (12px, □ prefix, border-bottom)
│ 🔴 [Owner] Urgent thing                      │ ← .urgent gets 🔴 prefix
│ +3 more...                                   │
│                                              │
│ COMPETE                                      │
│ [AWS] [Google Cloud]                         │ ← compete-tag (red tint pills)
│                                              │
│ NEXT ACTION                                  │
│ Schedule follow-up meeting                   │ ← from customers.md
└──────────────────────────────────────────────┘
```

### Card Health Borders
- `.urgent` → `border-color: #f85149`
- `.watch` → `border-color: #d29922`
- `.active` → `border-color: #3fb950`
- `.cold` → `border-color: #30363d`
- `:hover` → `border-color: #58a6ff`

### Badge Styles
- `badge-red` → `background: rgba(248,81,73,0.15); color: #f85149`
- `badge-yellow` → `background: rgba(210,153,34,0.15); color: #d29922`
- `badge-green` → `background: rgba(63,185,80,0.15); color: #3fb950`
- `badge-blue` → `background: rgba(88,166,255,0.15); color: #58a6ff`
- `badge-grey` → `background: rgba(72,79,88,0.2); color: #8b949e`

### Compete Tags
```css
.compete-tag {
  background: rgba(248,81,73,0.1);
  border: 1px solid rgba(248,81,73,0.2);
  color: #f85149;
  font-size: 11px;
  padding: 2px 6px;
  border-radius: 4px;
}
```

### Layout
- **Page max-width:** 1400px, centered
- **Header padding:** 32px 48px
- **Main padding:** 32px 48px
- **Card grid:** `repeat(auto-fill, minmax(380px, 1fr))`, gap 20px
- **Card border-radius:** 12px

### Responsive
```css
@media (max-width: 768px) {
  header, main { padding: 20px 16px; }
  .accounts-grid { grid-template-columns: 1fr; }
}
```

### Print
```css
@media print {
  .filter-bar, .search-box { display: none; }
  .card { break-inside: avoid; }
  body { background: white; color: black; }
}
```

## Output Rules

1. **Self-contained** — ALL CSS and JS must be inline. Zero external resources. No CDN links.
2. **Save to** `data/outputs/` with a descriptive filename (e.g., `territory-dashboard-2026-03-24.html`, `cigna-deepdive-2026-03-24.html`)
3. **Open in browser** after generating (use `open` on macOS, `xdg-open` on Linux)
4. **Handle missing data gracefully** — not every customer has every file. Show what exists, skip what doesn't.
5. **Never hallucinate data** — if a file doesn't exist, don't invent content for that section.

## File Reading Order

When generating a **territory dashboard**, read:
1. `customers.md` — get the full customer list, health, status
2. For each customer directory in `cust/*/context/`:
   - `index.md` — tracks, action items, overview
   - `personas.md` — stakeholder names and roles (skim for `**Name:**` lines and role descriptions)
   - `meeting-notes/` — list filenames for dates and count
   - `competitors.md` — skim for `##` competitor headers

When generating a **deep dive**, read ALL files in `cust/<slug>/context/`:
- `index.md`, `personas.md`, `architecture.md`, `opp-history.md`, `competitors.md`, `CHANGELOG.md`
- All files in `meeting-notes/` (read summaries/key topics, not full transcripts)

## Example

User: "generate a territory report"

You:
1. Read `customers.md`
2. Read each customer's key files (index.md, personas.md, meeting-notes/)
3. Produce a single self-contained HTML file following the design system
4. Save to `data/outputs/territory-dashboard-YYYY-MM-DD.html`
5. Open in browser
