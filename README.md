# Customer Hub

A **Context-First** customer relationship management system built on Markdown and AI assistants.

Customer Hub is designed for solution engineers, account executives, and technical sellers who manage multiple customer relationships simultaneously. Instead of a traditional CRM, your customer knowledge lives in structured Markdown files that AI assistants (GitHub Copilot, Claude, OpenClaw, ChatGPT) can read, understand, and help you maintain.

## Why Customer Hub?

- **Context-First:** AI assistants read your customer files and give context-aware help — meeting prep, email drafts, architecture suggestions, opportunity summaries
- **Portable:** It's just Markdown files in a git repo. No vendor lock-in, no SaaS fees
- **Version Controlled:** Full history of every customer interaction, decision, and change
- **AI-Native:** Built from the ground up for AI assistant workflows

## Quick Start

```bash
# Clone the repo
git clone https://github.com/YOUR_USERNAME/customer-hub.git
cd customer-hub

# Add your first customer
./scripts/add_customer.sh acme-corp

# Add a meeting note
./scripts/new_meeting.sh acme-corp "2025-03-15" "Architecture Review"
```

## Directory Structure

```
.
├── AGENTS.md                  # AI assistant entry point
├── .github/
│   └── copilot-instructions.md
├── cust/                      # Customer data root
│   └── <customer-name>/
│       └── context/           # Source of Truth per customer
│           ├── index.md       # Dashboard & navigation
│           ├── personas.md    # Key stakeholders
│           ├── architecture.md # Technical environment
│           ├── opp-history.md # Opportunities & history
│           ├── competitors.md # Competitive landscape
│           ├── CHANGELOG.md   # Status & change tracking
│           └── meeting-notes/ # Chronological meeting notes
├── strategy/                  # Internal programs & initiatives
├── community/                 # Professional communities & peer groups
├── network/                   # Partner & vendor relationships
├── profile/                   # Personal dashboards & goals
├── wiki/                      # Static reference material
├── data/                      # Workspace-level datasets & reports
├── docs/                      # Context Anchors (methodology & rules)
├── scripts/                   # Automation utilities
│   ├── add_customer.sh
│   ├── add_strategy.sh
│   ├── add_community.sh
│   ├── new_meeting.sh
│   ├── generate_report.py     # Territory & customer reports (HTML)
│   ├── optimize-images.sh     # PNG optimization (pngquant)
│   └── hooks/
│       └── pre-commit         # Auto-optimize images on commit
└── plans/                     # Feature & workflow plans
```

## Skills

Built-in AI assistant skills in `skills/`:

| Skill | Description |
|:---|:---|
| **customer-hub** | Core CRM workflows — load customers, process transcripts, meeting prep, email drafting |
| **customer-hub-merge** | Extract customer data from ChatGPT/Teams Copilot conversations and merge into context files |
| **livemeeting** | Real-time meeting assistant — paste transcript chunks and get live summaries + action items |
| **reporting** | Generate HTML territory dashboards, customer deep-dives, and weekly activity reports |

## For AI Assistants

If you're an AI assistant working with this repository:

👉 **Start here:** [AGENTS.md](AGENTS.md)
👉 **Full protocol:** [docs/AGENT_INSTRUCTIONS.md](docs/AGENT_INSTRUCTIONS.md)

## Context-First Development

This project uses **Context-First Agentic Development** — a methodology where documentation drives AI behavior.

- **Logic:** [docs/BUSINESS_RULES.md](docs/BUSINESS_RULES.md)
- **Structure:** [docs/ARCHITECTURE.md](docs/ARCHITECTURE.md)
- **Methodology:** [docs/CONTEXT_FIRST_METHODOLOGY.md](docs/CONTEXT_FIRST_METHODOLOGY.md)

## Image Optimization

Screenshots and images are automatically optimized using `pngquant` to reduce file size by ~70% while keeping text sharp.

**Setup:**
```bash
# Install pngquant
brew install pngquant  # macOS
apt install pngquant   # Ubuntu/Debian

# Install the pre-commit hook (auto-optimizes PNGs on commit)
cd .git/hooks && ln -sf ../../scripts/hooks/pre-commit pre-commit
```

**Manual optimization:**
```bash
# Optimize all PNGs in the repo
./scripts/optimize-images.sh

# Optimize specific files
./scripts/optimize-images.sh path/to/image.png
```

## Data Processing

Optional Python scripts for analyzing workspace data:

```bash
# Set up Python environment
python3 -m venv .venv
. .venv/bin/activate
pip install -r requirements.txt

# Generate UI report
python scripts/data-processing/generate_context_ui.py
```

## Customization

This is a template. Make it yours:

1. **Fork or clone** this repo
2. **Add your customers** with `./scripts/add_customer.sh`
3. **Customize `docs/BUSINESS_RULES.md`** with your industry/role-specific rules
4. **Add wiki content** for your organization's reference material
5. **Set up the pre-commit hook** for image optimization
6. **Set up upstream** for future updates: `git remote add upstream https://github.com/idanshimon/customer-hub-oss.git`

## Reports

Generate self-contained HTML reports from your customer data:

```bash
# Territory dashboard — all customers at a glance
python scripts/generate_report.py

# Single customer deep-dive
python scripts/generate_report.py --customer acme-corp

# Weekly activity summary
python scripts/generate_report.py --weekly

# Open in browser automatically
python scripts/generate_report.py --open
```

Reports are saved to `data/outputs/` as standalone HTML files — no dependencies, works offline, share with your manager.

## License

MIT
