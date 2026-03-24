# Architecture & Structure

This file defines the structural design and technical stack of the Customer Hub.

## 1. Tech Stack
- **Core:** Markdown (Documentation as Code).
- **Automation:** Bash Scripts (`/scripts`) for workflow automation.
- **Data Processing:** Python Scripts (`/scripts/data-processing`) for analysis and reporting.
- **Editor:** VS Code with recommended extensions.
- **AI Assistant:** GitHub Copilot or any AI coding assistant.

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
├── docs/                   # Project Documentation (Context Anchors)
├── scripts/                # Automation utilities
│   ├── add_customer.sh     # Workflow: Create new customer folder
│   ├── new_meeting.sh      # Workflow: Create meeting note
│   └── data-processing/    # Data analysis and reporting scripts
├── customers.md            # Global index
└── README.md               # Entry point
```

## 3. Component Relationships
- **Scripts -> File System:** Scripts are the primary interface for mutating the file system (creating folders/files).
- **AI Agent -> Context:** The agent reads `cust/**/context/*.md` to generate context-aware responses.
- **User -> Index:** The `index.md` files serve as navigation hubs for the user.

## 4. Extension Configuration
- **VS Code Settings:** Enforced via `.vscode/settings.json` (Word wrap, Rulers).
- **Recommendations:** Enforced via `.vscode/extensions.json`.
