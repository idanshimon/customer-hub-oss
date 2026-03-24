# customers.md — Global Customer Index Format

## Purpose
Single file at repo root that lists ALL customers. Every customer folder under `cust/` MUST have a corresponding row. No orphaned folders.

## Health Legend
| Emoji | Meaning |
|:---:|:---|
| 🟢 | Active engagement |
| 🟡 | Needs attention |
| 🔴 | At risk |
| ⚪ | Not started / Unknown |
| — | Template (sample-customer) |

## Status Values
- **Not started** — folder exists but no real content yet
- **Initial** — basic scaffolding done, minimal context
- **Active** — actively engaged, context being maintained
- **On hold** — engagement paused
- **Inactive** — no longer in territory or engagement ended
- **Template** — sample-customer only

## Required Fields
| Column | Description |
|:---|:---|
| Customer Name | Display name (human-friendly, can include former names) |
| Folder Link | `[Link](cust/<slug>/context/index.md)` or `—` if not scaffolded |
| Health | Emoji from legend above |
| Next Action | One-line summary of what needs to happen next |
| Status | Lifecycle state from values above |

## Table Format
```markdown
| Customer Name | Folder Link | Health | Next Action | Status |
| :--- | :--- | :---: | :--- | :--- |
| Example Corp | [Link](cust/example/context/index.md) | 🟢 | Schedule follow-up | Active |
```
