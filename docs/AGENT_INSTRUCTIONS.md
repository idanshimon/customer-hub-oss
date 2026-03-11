# Agent Instructions (AI Assistant Guide)

This file provides context and workflow instructions for AI assistants (GitHub Copilot, Claude, OpenClaw agents, ChatGPT, etc.) working with this repository.

---

This repository is a **Context-First Customer Hub** for managing customer context, notes, personas, architectures, and opportunity history.

## Context-First Methodology
This project follows **Context-First Agentic Development**.
- **Logic:** Always check `docs/BUSINESS_RULES.md` for operational rules and constraints.
- **Structure:** Always check `docs/ARCHITECTURE.md` for folder structure and tech stack details.
- **Methodology:** Refer to `docs/CONTEXT_FIRST_METHODOLOGY.md` for the philosophy.

## Structure

### Customers
Each customer lives under `cust/<customer-name>/context/`.

**Important:** When you scaffold a new customer folder, you must immediately update `customers.md` with:
- A row linking to the new customer's dashboard (`cust/<slug>/context/index.md`)
- Initial `Health` (typically `⚪`), `Next Action`, and `Status` (typically `Active` or `Not started`)

### Community
Professional communities and peer groups live under `community/<group-name>/context/`.

These follow the **same Context-First structure** (index.md, personas.md, meeting-notes/) but represent your professional network — peer groups you collaborate with, not programs you execute against.

**Scripts:**
- `scripts/add_community.sh <community-name>` — scaffold a new community entry
- `scripts/new_meeting.sh <community-name> "YYYY-MM-DD" "topic"` — works for customers, strategies, and communities

### Strategy
Internal programs and strategic initiatives live under `strategy/<initiative-name>/context/`.

These follow the **same Context-First structure** as customers (index.md, personas.md, meeting-notes/) but represent internal programs that shape how you sell and execute across customers.

**Scripts:**
- `scripts/add_strategy.sh <strategy-name>` — scaffold a new strategy entry
- `scripts/new_meeting.sh <strategy-name> "YYYY-MM-DD" "topic"` — works for both customers and strategies

## Source of Truth
When working inside any customer folder (e.g., `cust/acme-corp/context/`), treat the files in that `context/` folder as the **SOURCE OF TRUTH**.

You must load and prioritize the following files to understand the customer:
1. `index.md` (Overview and navigation)
2. `personas.md` (Stakeholders and roles)
3. `architecture.md` (Technical landscape)
4. `opp-history.md` (Objectives and history)
5. Recent meeting notes inside `meeting-notes/`

## Rules
- **DO NOT** mix data between customers.
- Use **ONLY** the active customer's context when assisting.
- If asked a question about "the customer", assume the one corresponding to the file currently open or the folder being worked in.

## Naming Conventions
- Meeting notes: `YYYY-MM-DD_<short-topic>.md`

## Chat Threads
Async team chat exports (e.g., Teams channels) live alongside meeting notes as a parallel context source.

### Structure
```
cust/<customer>/context/
├── meeting-notes/
├── chat-threads/
│   └── YYYY-MM-DD_<thread-name>.md
```

### Format
Chat thread files follow the same general structure as meeting notes but with these differences:
- **Type:** `Chat Thread` (not `Meeting`)
- **Date Range:** Start and end dates (threads span multiple days)
- **Participants:** Active contributors (not attendees)
- Content is **distilled** — extract decisions, action items, strategic signals, key quotes. Not raw paste.
- Reference images inline: `![description](../images/YYYY-MM-DD/filename.png)`

### Processing Protocol
When processing a raw chat export:
1. **Identify date range** and participants
2. **Extract by category:** Decisions, Action Items, Strategic Signals, Key Quotes, Competitive Intel
3. **Log images** — create/update `images.json` manifest in the relevant images folder
4. **Cross-reference** — update personas.md, opp-history.md, index.md action items as needed
5. **Changelog** — update CHANGELOG.md

## Image Manifest (`images.json`)
Every date folder containing images MUST have an `images.json` manifest.

### Location
```
cust/<customer>/context/meeting-notes/images/YYYY-MM-DD/
├── images.json        ← manifest
├── screenshot-1.png
└── diagram-2.png
```

### Schema
```json
[
  {
    "file": "filename.png",
    "source": "screenshot | shared_in_chat | shared_in_meeting | exported | generated",
    "captured_by": "Person Name",
    "captured_at": "ISO 8601 timestamp",
    "type": "screenshot | architecture_diagram | workflow_diagram | slide | reference_doc | ui_screenshot",
    "associations": {
      "customers": ["customer-slug"],
      "meetings": ["YYYY-MM-DD_meeting-name.md"],
      "topics": ["topic1", "topic2"]
    },
    "caption": "Human-readable description of what the image shows",
    "vision_analyzed": false
  }
]
```

### Required Fields
- `file`, `source`, `type`, `caption`

## Planning Protocol
- **Folder:** All feature and workflow plans live under `plans/`.
- **Template:** Use `plans/FEATURE_PLAN_TEMPLATE.md` as the starting point.
- **Workflow:**
    1. When asked to "plan a feature", create a new markdown file in `plans/` based on the template.
    2. Keep the plan in **Status: Draft** until explicitly approved.
    3. Once approved, implement the changes and update the relevant `CHANGELOG.md`.
    4. After implementation, set the plan Status to **Applied**.

## Behavior Guidelines

### Emails
- Draft emails using the tone and context found in `personas.md`.
- Reference specific objectives from `opp-history.md`.

### Meeting Prep
- Review the 2-3 most recent notes in `meeting-notes/`.
- Summarize open action items and risks.
- Propose an agenda based on the previous meeting's "Follow-Up" section.

### Architecture Drafting
- Align suggestions with the "Current State" and "Dev tooling" in `architecture.md`.
- Highlight potential risks based on "Risks and open questions".

### Opportunity Summaries
- Update or reference `opp-history.md`.
- Focus on blockers and competitive threats.

### Customer Recaps
- Synthesize information from `index.md` and recent notes to provide a high-level status update.

## Python Environment Protocol
- **Virtual Environment:** This repository uses Python 3 with a `.venv` virtual environment.
- **Requirement:** Before running ANY Python scripts:
  ```bash
  . .venv/bin/activate && python3 scripts/your-script.py
  ```

## Changelog Protocol
- **File:** `cust/<customer-name>/context/CHANGELOG.md`.
- **Rule:** After every significant update:
    1. **Update Status:** Rewrite the "Current Account Status" section.
    2. **Update History:** Append rows to the "Change History" table.
- **Format:**
    ```markdown
    # Changelog & Account Status

    ## Current Account Status
    **As of YYYY-MM-DD**

    ### 🟢 General Health
    - [Bullet points]

    ### 📋 Latest Tasks & Action Items
    - [ ] [Task 1]

    ## Change History
    | Date | Category | Change Details | Files Modified |
    ...
    ```

## Transcript Processing Protocol
When provided a raw meeting transcript, perform a **Multi-Pass Extraction**:

1.  **Pass 1: Meeting Note Generation**
    - Create a detailed summary with **Objective**, **Key Discussion Points**, **Decisions**, **Risks**, **Action Items**, and **Follow-Up**.

2.  **Pass 2: Context Extraction (The "So What?")**
    - **Personas:** Identify new people. Classify them by organization. Note their goals/concerns.
    - **Architecture:** Extract new tech stack details, cloud usage, or tools mentioned.
    - **Opportunities:** Extract sales blockers, competitors mentioned, or timeline updates.

3.  **Execution**
    - Create the meeting note file and update context files (`personas.md`, `architecture.md`, `opp-history.md`).
    - Update the customer's `CHANGELOG.md`.
    - Provide a concise confirmation of files updated.
