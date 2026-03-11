# Architecture & Structure

## 1. Tech Stack
- **Core:** Markdown (Documentation as Code).
- **Automation:** Bash Scripts (`/scripts`) for workflow automation.
- **Data Processing:** Python Scripts (`/scripts/data-processing`) for analysis and reporting.
- **Editor:** VS Code with recommended extensions.
- **AI Assistant:** GitHub Copilot, Claude, OpenClaw, or any AI coding assistant.

## 2. Directory Structure
```
.
├── .github/                # Copilot configuration & instructions
├── .vscode/                # Editor settings
├── data/                   # Workspace-level datasets
│   ├── source/             # Source files (version controlled)
│   ├── exports/            # CSV conversions (auto-generated)
│   └── outputs/            # Derived reports (auto-generated)
├── cust/                   # Customer data root
│   └── <customer-name>/    # Individual customer container
│       └── context/        # Customer Knowledge Base (Source of Truth)
├── strategy/               # Internal programs & initiatives
├── community/              # Professional communities & peer groups
├── network/                # Partner & vendor relationships
├── wiki/                   # Static reference material
├── docs/                   # Project Documentation (Context Anchors)
├── scripts/                # Automation utilities
│   ├── add_customer.sh     # Workflow: Create new customer folder
│   ├── new_meeting.sh      # Workflow: Create meeting note
│   ├── optimize-images.sh  # PNG optimization
│   └── hooks/
│       └── pre-commit      # Auto-optimize images on commit
├── plans/                  # Feature & workflow plans
├── customers.md            # Global customer index
└── README.md               # Entry point
```

## 3. Component Relationships
- **Scripts → File System:** Scripts are the primary interface for mutating the file system (creating folders/files).
- **AI → Context:** AI assistants read `cust/**/context/*.md` to generate context-aware responses.
- **User → Index:** The `index.md` files serve as navigation hubs.

## 4. Image Optimization
- PNGs are auto-optimized on commit via pre-commit hook (pngquant)
- ~70% size reduction with no visible quality loss for screenshots
- Setup: `cd .git/hooks && ln -sf ../../scripts/hooks/pre-commit pre-commit`
