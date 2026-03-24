# AGENTS.md - AI Assistant Guide

This file helps AI assistants (GitHub Copilot, Claude, OpenClaw, ChatGPT, etc.) understand how to work with this repository.

## First Run

Before helping with any task in this repository:

1. **Read the agent instructions:**
   - [docs/AGENT_INSTRUCTIONS.md](docs/AGENT_INSTRUCTIONS.md) - Full workflow and protocol guide

2. **Understand the context methodology:**
   - [docs/CONTEXT_FIRST_METHODOLOGY.md](docs/CONTEXT_FIRST_METHODOLOGY.md)
   - [docs/BUSINESS_RULES.md](docs/BUSINESS_RULES.md)
   - [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)

3. **If working on a customer:**
   - Navigate to `cust/<customer-name>/context/`
   - Read these files in order:
     1. `index.md` - Overview and dashboard
     2. `personas.md` - Key stakeholders
     3. `architecture.md` - Technical environment
     4. `opp-history.md` - Sales opportunities and history
     5. `competitors.md` - Competitive landscape at this account
     6. Recent files in `meeting-notes/` folder

## Protected Paths (DO NOT MODIFY)

The following paths are maintained by the upstream template and updated via `git merge upstream/main`.
Do **NOT** create, edit, or delete files in these directories:

- `docs/` — Methodology and business rules
- `scripts/` — Scaffolding and automation
- `skills/` — Agent skills (updated via upstream)
- `.github/` — Copilot instructions
- `AGENTS.md` — This file

**You MAY freely create and edit:**

- `cust/` — All customer data (your source of truth)
- `strategy/` — Your strategic notes and initiatives
- `community/` — Your professional communities
- `network/` — Your partner and vendor relationships
- `wiki/` — Shared knowledge (additions welcome)
- `profile/` — Personal dashboards and goals
- `customers.md` — Your customer index
- `data/` — Your exports and reports
- `plans/` — Your feature plans

If the user asks you to modify a protected path, remind them:
> "That file is managed by the upstream template. To propose changes, open an issue or PR on the [upstream repo](https://github.com/idanshimon/customer-hub-oss) instead."

### Receiving Upstream Updates

```bash
# One-time setup (after cloning)
git remote add upstream https://github.com/idanshimon/customer-hub-oss.git

# Pull latest template updates (skills, docs, scripts)
git fetch upstream
git merge upstream/main
```

Your customer data in `cust/`, `strategy/`, `wiki/`, etc. will not be affected by upstream merges.

## Key Rules

- **Competitive Intelligence:** When discussing competitors at any account, check `strategy/competitors/` for cross-customer research first, then the account-specific `competitors.md` for account-level intel.
- **Source of Truth:** Customer context files in `cust/<customer-name>/context/` are authoritative
- **Don't Mix Customers:** Never blend data between customer folders
- **Python Scripts:** Always activate `.venv` before running Python scripts
- **Updates:** After making changes, update the customer's `CHANGELOG.md`
- **Screenshots:** Save meeting screenshots to `meeting-notes/images/YYYY-MM-DD/` with descriptive filenames. Screenshots are first-class meeting artifacts — capture screenshares, architecture diagrams, whiteboard sessions, and any visual context shared during calls. Always note the capture/save date and source (e.g., "Source: Team meeting, Captured: March 5, 2026") so future sessions know how current the image is.

## Repository Purpose

A Context-First customer relationship management system for solution engineers and technical sellers managing multiple customer engagements.

## Structure

- **`cust/`** — Customer engagements
- **`strategy/`** — Internal programs and initiatives (GTM motions, platform strategies)
- **`community/`** — Professional communities and peer groups (guilds, working groups)
- **`network/`** — Partner and vendor relationships
- **`wiki/`** — Static reference material (org tree, glossary, tools, processes)
- **`plans/`** — Feature and workflow plans
- **`data/`** — Exports and processed data

## Quick Commands

```bash
# Add a new customer
./scripts/add_customer.sh <customer-name>

# Add a strategy entry (internal programs/initiatives)
./scripts/add_strategy.sh <strategy-name>

# Add a community entry (peer groups/professional networks)
./scripts/add_community.sh <community-name>

# Add a meeting note (works for customers, strategies, and communities)
./scripts/new_meeting.sh <name> "YYYY-MM-DD" "topic"
```

## For More Details

See [docs/AGENT_INSTRUCTIONS.md](docs/AGENT_INSTRUCTIONS.md) for complete protocols on:
- Planning features
- Processing meeting transcripts
- Drafting emails
- Preparing for meetings
- Updating architecture docs
- Managing opportunities
