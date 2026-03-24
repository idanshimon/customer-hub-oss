---
name: customer-hub
description: "Customer Hub — a context-first CRM for Solution Engineers and technical sellers. Markdown-based repo for structured customer context: personas, architecture, opportunities, meeting notes, changelogs. Use when asked to load a customer, create a new customer, add meeting notes, process transcripts, update personas, prep for meetings, draft emails, review opportunities, check the customer index, update changelogs, work with the internal wiki, plan features, or any request to read/write customer intelligence. Also handles internal wiki (org tree, glossary, partner contacts, initiative guides)."
---

# Customer Hub

Markdown-based CRM for Solution Engineers and technical sellers. Each customer has structured context files; an AI agent reads these to provide context-aware assistance across sales, architecture, and engineering.

## Repo
The repo root (wherever you cloned this repository).

## Philosophy
This system follows **Context-First Agentic Development** — documentation is the control plane for the AI. The agent never guesses business logic; it reads the context files as source of truth. See `references/context-first-methodology.md` for details.

---

## Directory Layout
```
customer-hub/
├── customers.md              # Global index (all customers, health, status)
├── cust/
│   ├── sample-customer/      # Template (copied by add_customer.sh)
│   │   └── context/
│   │       ├── index.md          # Dashboard + nav + action items
│   │       ├── personas.md       # Stakeholders (exec sponsors, TDMs, champions)
│   │       ├── architecture.md   # Tech stack + current state
│   │       ├── opp-history.md    # Opportunities, timeline, competitors, risks
│   │       ├── CHANGELOG.md      # Account health + change history
│   │       └── meeting-notes/
│   │           ├── README.md
│   │           └── YYYY-MM-DD_<topic>.md
│   └── <customer-slug>/      # Real customers follow same structure
│       └── context/ ...
├── wiki/                     # Internal knowledge (not customer-specific)
│   ├── README.md             # Wiki index
│   ├── people/               # Face photos, people pages
│   ├── meeting-notes/        # Internal session notes
│   └── *.md                  # Org tree, glossary, initiative guides, etc.
├── plans/                    # Feature plans (Draft → Approved → Applied)
│   └── FEATURE_PLAN_TEMPLATE.md
├── data/
│   ├── source/               # Raw datasets (NEVER modify programmatically)
│   ├── exports/              # CSV conversions
│   └── outputs/              # Generated reports + dashboards
├── scripts/
│   ├── add_customer.sh       # Scaffold new customer from sample-customer
│   ├── new_meeting.sh        # Create meeting note file + update index
│   └── data-processing/      # Python analysis scripts
├── docs/                     # Methodology, business rules, architecture
└── .github/                  # Copilot instructions
```

---

## Core Workflows

### Load a Customer
When user says "load [customer]", "go to [customer]", or "what do we know about [customer]":
1. Find the slug: `ls cust/`
2. Read in order: `index.md` → `personas.md` → `opp-history.md`
3. Read 2-3 most recent files in `meeting-notes/`
4. Skip `architecture.md` unless the request is technical
5. Confirm: "Loaded [Customer] — [summary]. Ready."

### New Customer
```bash
./scripts/add_customer.sh <slug>
```
This copies `sample-customer/context/` as the scaffold. Then:
- Edit `index.md` with real customer info
- **Update `customers.md`** with a new row (Health ⚪, Status "Not started")

### New Meeting Note
```bash
./scripts/new_meeting.sh <slug> "YYYY-MM-DD" "short-topic"
```
Script creates the file and inserts a link in `index.md` under "Recent Meeting Notes".
Write content using `references/meeting-note-template.md`.

**YAML frontmatter is required:**
```yaml
---
date: YYYY-MM-DD
customer: <slug>
topic: <short topic>
tags:
  - meeting
---
```

### Process a Transcript (Multi-Pass Extraction)
When user pastes a raw meeting transcript:
1. **Pass 1 — Meeting Note:** Create detailed summary (objective, discussion points with timestamps, decisions, risks, action items, follow-up)
2. **Pass 2 — Context Extraction ("The So What?"):**
   - **Personas:** New people → classify as Your Org / Customer / Partner. Add to `personas.md`.
   - **Architecture:** New tech stack details → update `architecture.md`
   - **Opportunities:** Blockers, competitors, timelines → update `opp-history.md`
3. **Pass 3 — Changelog:** Update `CHANGELOG.md` (rewrite status section + append history row)
4. Confirm files updated. Do NOT print full content unless asked.

### Meeting Prep
When user says "prep for [customer] meeting":
- Read 2-3 most recent meeting notes
- Summarize open action items and risks
- Propose agenda based on previous "Follow-Up" section

### Email Drafting
- Use tone/context from `personas.md`
- Reference specific objectives from `opp-history.md`

### Planning Protocol
Feature plans live in `plans/`. Start from `FEATURE_PLAN_TEMPLATE.md`:
1. Create plan file → Status: Draft
2. User approves → implement changes
3. Update relevant customer CHANGELOG
4. Set plan Status: Applied

---

## customers.md Format
Global index. Every customer folder MUST have a row here.

| Customer Name | Folder Link | Health | Next Action | Status |
|:---|:---|:---:|:---|:---|
| Example Corp | [Link](cust/example/context/index.md) | 🟢 | Schedule follow-up | Active |

**Health emojis:** 🟢 Active engagement · 🟡 Needs attention · 🔴 At risk · ⚪ Not started · — Template

**Status values:** Not started · Initial · Active · On hold · Inactive · Template

---

## Changelog Protocol
Every customer has `context/CHANGELOG.md`. After any significant update:
1. **Rewrite** the "Current Account Status" section (health + latest tasks)
2. **Append** a row to "Change History" table with date, category, change details, files modified

---

## Persona Classification
Always classify people as one of:
- **Your Org Team** — Account executives, architects, specialists, engineers, etc.
- **Customer Team** — Sponsor, TDM, Developer, Architect, etc.
- **Partner** — SI, ISV, contractor

Include Role/Title when available. Enrich existing entries; never overwrite.

---

## Wiki (Internal Knowledge)
Non-customer content lives at `wiki/`. See `wiki/README.md` for full index.
- **People:** `people/` (photos), org tree, account team directory, partner contacts
- **Initiatives:** Org-specific delivery programs and strategic initiatives
- **Technical:** Delivery guides, product positioning, migration playbooks
- **Processes:** Pipeline management, marketplace, POC playbook
- **Glossary:** Industry and org-specific acronyms

Wiki meeting notes (internal sessions, not customer-specific): `wiki/meeting-notes/`

---

## Data Processing
Python scripts in `scripts/data-processing/`. Always activate venv first:
```bash
. .venv/bin/activate
```
- `generate_context_ui.py` — HTML dashboard from customer context

**Data rules:** Never modify `data/source/` programmatically. Latest month in consumption data is always incomplete — exclude from trend calculations but display for reference.

---

## Key Rules
- **Never mix customer data** — when working in `cust/acme/`, ignore all other customers
- **Personas are source of truth** — enrich, never overwrite
- **Meeting note filenames:** `YYYY-MM-DD_<topic>.md` (kebab-case, ISO dates)
- **YAML frontmatter required** on meeting notes
- **Always update CHANGELOG** after changes
- **New customers must appear in `customers.md`**
- **Never modify `data/source/`** files programmatically
- **Use scripts** for scaffolding (`add_customer.sh`, `new_meeting.sh`)
