# Business Rules & Logic

This file is the **Source of Truth** for all business logic, constraints, and operational rules for the Customer Hub. AI Agents must reference this file before suggesting changes or creating new content.

## 0. Operational Context
- **Identity:** We are **Solution Engineers / Technical Sellers**.
- **Customers:** All entities in `cust/` are our customers.
- **Goal:** We drive technical success, architecture design, and POCs to unblock sales opportunities.

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
- **Constraint:** Do not treat `data/` files as customer context; they are shared inputs and must not be copied verbatim into a customer's `context/` without explicit intent.

## 3. Naming Conventions
- **Meeting Notes:** Must follow `YYYY-MM-DD_<short-topic>.md`.
    - Spaces in topics must be replaced with hyphens.
    - Date must be ISO 8601 (`YYYY-MM-DD`).
- **Customer Folders:** Lowercase, hyphen-separated (kebab-case).

## 4. Content Structure
- **Markdown Only:** All content must be in Markdown format.
- **Frontmatter:** Meeting notes must include YAML frontmatter with `date`, `customer`, `topic`, and `tags`.
- **Persona Identification:** In meeting notes and `personas.md`, you must explicitly distinguish between:
    - **Your Org Team:** (e.g., account executives, architects, specialists, engineers).
    - **Customer Team:** (e.g., Sponsor, TDM, Developer).
    - **Partners:** (e.g., SIs, ISVs).
    - *Always include Role/Title when available.*

## 5. Automation
- **Script Usage:** Creating customers and meeting notes should be done via the provided scripts (`scripts/add_customer.sh`, `scripts/new_meeting.sh`) to ensure consistency.

### 5.1 Customer Index Maintenance
- **Rule:** When a new customer folder is created under `cust/`, you **must** add or update the corresponding row in `customers.md`.
- **Required Fields:**
    - `Customer Name`: Display name (human-friendly format)
    - `Folder Link`: Link to `cust/<slug>/context/index.md` (or `—` if not scaffolded)
    - `Health`: Emoji indicator (`🟢` Active, `🟡` Needs attention, `🔴` At risk, `⚪` Not started/Unknown)
    - `Next Action`: One-line summary
    - `Status`: Lifecycle state (`Not started`, `Active`, `On hold`, `Template`)
- **Constraint:** Do not create orphaned customer folders that are not listed in `customers.md`.

### 5.2 Data Processing Scripts
- **Location:** Data analysis and reporting scripts live under `scripts/data-processing/`.
- **Purpose:** These scripts process workspace-level datasets (`data/`) to generate insights, reports, and filtered views.
- **Data Lineage:** Scripts read from `data/exports/` (CSV conversions) and write to `data/outputs/` (reports).
- **Source Protection:** Scripts must never modify files in `data/source/` - source files are manually maintained only.
- **Separation:** Keep workflow automation (e.g., `add_customer.sh`) separate from data processing scripts.

## 6. Consumption Data Constraints
- **Latest Month Incompleteness:** The most recent month in consumption data is often **incomplete** and not finalized until approximately the 10th of the following month.
- **Impact:** This causes the latest month to appear artificially low, distorting trend analysis if included in averaging calculations.
- **Mitigation Strategy:**
  - **Display:** Always show the latest month data in dashboards for reference.
  - **Trending Calculations:** When computing Average Month-over-Month (MoM) growth, **exclude the latest month**.
  - **Communication:** Dashboards and reports must clearly document this constraint.
