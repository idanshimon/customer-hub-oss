# Business Rules & Logic

This file is the **Source of Truth** for all business logic, constraints, and operational rules for the Customer Hub. AI Agents must reference this file before suggesting changes or creating new content.

## 0. Operational Context
- **Customers:** All entities in `cust/` are your customers/accounts.
- **Goal:** Drive technical success, architecture design, and POCs to support customer engagements.

## 1. Customer Isolation
- **Rule:** Data between customers must NEVER be mixed.
- **Constraint:** When working in `cust/<customer-A>`, the agent must ignore context from `cust/<customer-B>`.
- **Reasoning:** Privacy and data integrity are paramount.

## 2. Source of Truth
- **Rule:** The `context/` folder within a customer directory is the absolute source of truth for that customer.
- **Priority:**
    1. `index.md` (Dashboard)
    2. `personas.md` (Stakeholders)
    3. `architecture.md` (Tech Stack)
    4. `opp-history.md` (Sales Context)
    5. `meeting-notes/*.md` (Chronological Data)

## 2.1 Workspace-Level Data
- **Rule:** Workspace-level datasets (e.g., territory alignment) live in `data/`.
- **Constraint:** Do not treat `data/` files as customer context; they are shared inputs.

## 3. Naming Conventions
- **Meeting Notes:** Must follow `YYYY-MM-DD_<short-topic>.md`.
    - Spaces in topics must be replaced with hyphens.
    - Date must be ISO 8601 (`YYYY-MM-DD`).
- **Customer Folders:** Lowercase, hyphen-separated (kebab-case).

## 4. Content Structure
- **Markdown Only:** All content must be in Markdown format.
- **Frontmatter:** Meeting notes must include YAML frontmatter with `date`, `customer`, `topic`, and `tags`.
- **Persona Identification:** In meeting notes and `personas.md`, explicitly distinguish between:
    - **Your Team:** Internal stakeholders.
    - **Customer Team:** Sponsor, decision makers, developers.
    - **Partners:** SIs, ISVs, vendors.
    - *Always include Role/Title when available.*

## 5. Automation
- **Script Usage:** Creating customers and meeting notes should be done via the provided scripts to ensure consistency.

### 5.1 Customer Index Maintenance
- **Rule:** When a new customer folder is created under `cust/`, you **must** add or update the corresponding row in `customers.md`.
- **Required Fields:**
    - `Customer Name`: Display name
    - `Folder Link`: Link to `cust/<slug>/context/index.md`
    - `Health`: Emoji indicator (`🟢` Active, `🟡` Needs attention, `🔴` At risk, `⚪` Not started)
    - `Next Action`: One-line summary
    - `Status`: Lifecycle state (`Not started`, `Active`, `On hold`)
- **Constraint:** Do not create orphaned customer folders that are not listed in `customers.md`.

### 5.2 Data Processing Scripts
- **Location:** Data analysis scripts live under `scripts/data-processing/`.
- **Data Lineage:** Scripts read from `data/exports/` and write to `data/outputs/`.
- **Source Protection:** Scripts must never modify files in `data/source/`.
