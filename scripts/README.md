# Scripts

Utility and automation scripts for managing the customer hub.

## Quick Reference

| Script | Purpose | Usage |
|--------|---------|-------|
| `add_customer.sh` | Scaffold a new customer folder | `./scripts/add_customer.sh <customer-name>` |
| `add_strategy.sh` | Scaffold a new strategy entry | `./scripts/add_strategy.sh <strategy-name>` |
| `add_community.sh` | Scaffold a new community entry | `./scripts/add_community.sh <community-name>` |
| `new_meeting.sh` | Create a meeting note template | `./scripts/new_meeting.sh <name> "YYYY-MM-DD" "Topic"` |
| `optimize-images.sh` | Optimize PNGs with pngquant | `./scripts/optimize-images.sh [file]` |

## Details

### Workflow Scripts

**`add_customer.sh`**
- Creates a new customer folder structure under `cust/<customer-name>/context/`
- Initializes index.md, personas.md, architecture.md, opp-history.md, CHANGELOG.md
- Creates meeting-notes/ directory
- **Requires:** Customer name as argument

**`add_strategy.sh`**
- Creates a strategy folder under `strategy/<name>/context/`
- Same Context-First structure as customers
- For internal programs, GTM motions, platform strategies

**`add_community.sh`**
- Creates a community folder under `community/<name>/context/`
- For peer groups, guilds, working groups

**`new_meeting.sh`**
- Generates a meeting note file with template structure
- Works for customers, strategies, and communities
- **Requires:** Name, date (YYYY-MM-DD), and topic
- **Example:** `./scripts/new_meeting.sh acme-corp "2025-12-30" "Q1 Planning"`

**`optimize-images.sh`**
- Optimizes PNG files using pngquant (~70% size reduction)
- Run on all PNGs or specific files
- Pre-commit hook available in `hooks/pre-commit`

## Python Environment

Before running any Python scripts:
```bash
. .venv/bin/activate && python3 scripts/your-script.py
```
