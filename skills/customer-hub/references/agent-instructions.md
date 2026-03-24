# Agent Instructions (AI Assistant Guide)

This file provides context and workflow instructions for AI assistants working with this repository.

---

This repository is a customer hub for storing context, notes, personas, architectures, and opportunity history.

## Context-First Methodology
This project follows **Context-First Agentic Development**.
- **Logic:** Always check `docs/BUSINESS_RULES.md` for operational rules and constraints.
- **Structure:** Always check `docs/ARCHITECTURE.md` for folder structure and tech stack details.
- **Methodology:** Refer to `docs/CONTEXT_FIRST_METHODOLOGY.md` for the philosophy.

## Structure
Each customer lives under `cust/<customer-name>/context/`.

**Important:** When you scaffold a new customer folder, you must immediately update `customers.md` with:
- A row linking to the new customer's dashboard (`cust/<slug>/context/index.md`)
- Initial `Health` (typically `⚪`), `Next Action`, and `Status` (typically `Active` or `Not started`)

## Source of Truth
When working inside any customer folder (e.g., `cust/acme-corp/context/`), treat the files in that `context/` folder as the **SOURCE OF TRUTH**.

Load and prioritize the following files to understand the customer:
1. `index.md` (Overview and navigation)
2. `personas.md` (Stakeholders and roles)
3. `architecture.md` (Technical landscape)
4. `opp-history.md` (Objectives and history)
5. Recent meeting notes inside `meeting-notes/`

## Rules
- **DO NOT** mix data between customers.
- Use **ONLY** the active customer's context when assisting.
- If the user asks about "the customer", assume they mean the one corresponding to the file currently open or the folder being worked in.

## Naming Conventions
- Meeting notes: `YYYY-MM-DD_<short-topic>.md`

## Planning Protocol
- **Folder:** All feature and workflow plans live under `plans/`.
- **Template:** Use `plans/FEATURE_PLAN_TEMPLATE.md` as the starting point.
- **Workflow:**
    1. When asked to "plan a feature", create a new markdown file in `plans/` based on the template.
    2. Keep the plan in **Status: Draft** until explicitly approved.
    3. Once approved, implement the changes described in the plan and update the relevant customer's `CHANGELOG.md`.
    4. After implementation, set the plan Status to **Applied**. The file may then be archived or deleted.

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
- **Virtual Environment:** This repository uses Python 3 with a `.venv` virtual environment located at the workspace root.
- **Requirement:** Before running ANY Python scripts, you MUST:
  1. **Check if `.venv` exists:** `test -d .venv && echo "venv found" || echo "venv not found"`
  2. **Activate the venv:** `. .venv/bin/activate`
  3. **Then run your script:** `python3 scripts/data-processing/<script>.py`
- **Combined Command:**
  ```bash
  . .venv/bin/activate && python3 scripts/data-processing/<script>.py
  ```

## Changelog Protocol
- **File:** `cust/<customer-name>/context/CHANGELOG.md`.
- **Rule:** After every significant update, you must:
    1.  **Update Status:** Rewrite the "Current Account Status" section (Health + Latest Tasks).
    2.  **Update History:** Append rows to the "Change History" table detailing *specific* changes.
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
When a raw meeting transcript is provided, perform a **Multi-Pass Extraction**:

1.  **Pass 1: Meeting Note Generation**
    - Create a highly detailed summary following the `meeting-notes` template.
    - Capture **Objective**, **Key Discussion Points** (with timestamps if available), **Decisions**, **Risks**, **Action Items**, and **Follow-Up**.

2.  **Pass 2: Context Extraction (The "So What?")**
    - **Personas:** Identify new people. Classify them as **Your Org**, **Customer**, or **Partner**. Note their goals/concerns.
    - **Architecture:** Extract new tech stack details, cloud usage, or tools mentioned.
    - **Opportunities:** Extract sales blockers, competitors mentioned, or timeline updates.

3.  **Execution**
    - **Action:** Create the meeting note file and update the context files (`personas.md`, `architecture.md`, `opp-history.md`) immediately.
    - **Changelog:** Update the customer's `CHANGELOG.md` (Rewrite Status + Append History).
    - **Output:** Provide a concise confirmation of files updated. Do not print the full content unless asked.
