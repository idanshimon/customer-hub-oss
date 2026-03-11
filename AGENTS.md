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
     5. Recent files in `meeting-notes/` folder

## Key Rules

- **Source of Truth:** Customer context files in `cust/<customer-name>/context/` are authoritative
- **Don't Mix Customers:** Never blend data between customer folders
- **Python Scripts:** Always activate `.venv` before running Python scripts
- **Updates:** After making changes, update the customer's `CHANGELOG.md`
- **Screenshots:** Save meeting screenshots to `meeting-notes/images/YYYY-MM-DD/` with descriptive filenames. Screenshots are first-class meeting artifacts — capture screenshares, architecture diagrams, whiteboard sessions, and any visual context shared during calls.

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
