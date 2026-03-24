# Sample Customer Templates

These are the scaffold templates created by `add_customer.sh`. New customers start with these files.

---

## index.md
```markdown
# [Customer Name] - Context Dashboard

## Overview
High-level summary of the customer, their business, and our current engagement status.

## Stakeholders
[View Personas](personas.md)

## Architecture
[View Architecture & Tech Stack](architecture.md)

## Objectives / Opportunities
[View Opportunity History](opp-history.md)

## Recent Meeting Notes
- [YYYY-MM-DD Topic](meeting-notes/YYYY-MM-DD_topic.md)

## Action Items
- [ ] [Owner] Action item 1
- [ ] [Owner] Action item 2

## Quick Links
- [Architecture](architecture.md)
- [Opp History](opp-history.md)
- [Meeting Notes Folder](meeting-notes/)
```

---

## personas.md
```markdown
# Personas & Stakeholders

## Executive Sponsors
**Name:** [Name]
**Role:** [Title]
**Goals:**
- Strategic alignment
- ROI
**Concerns:**
- Cost
- Security
**Buying Criteria:**
- Business value

## Technical Decision Makers
**Name:** [Name]
**Role:** [Title]
**Goals:**
- Technical feasibility
- Integration
**Concerns:**
- Complexity
- Maintenance
**Tools:**
- Azure, GitHub, etc.

## Day-to-day Champions
**Name:** [Name]
**Role:** [Title]
**Goals:**
- Getting things done
- Learning new tech
**Concerns:**
- Time
- Learning curve
```

### Classification Rules
Always tag each person as one of:
- **Your Org Team** — Account executives, architects, specialists, engineers, etc.
- **Customer Team** — Sponsor, TDM, Developer, Architect, IT Principal, etc.
- **Partner** — SI, ISV, contractor

Include Role/Title when available. Enrich existing entries; never overwrite or remove people.

---

## architecture.md
```markdown
# Architecture & Technical Landscape

## Current State
- EHR: [Epic / Cerner / etc.]
- Cloud: [Azure / AWS / GCP / hybrid]
- Dev tooling: [GitHub / ADO / GitLab]
- Languages: [Java / .NET / Python / etc.]

## Risks and Open Questions
- [Risk 1]
- [Open question 1]
```

---

## opp-history.md
```markdown
# Opportunity History & Objectives

## Summary
Brief overview of the sales opportunity.

## Opportunity Timeline
- **YYYY-QN:** [Milestone]

## Competitive Notes
- List only competitors explicitly mentioned in meetings/documents.
- **[Vendor Name]:** [Notes]

## Risks / Blockers
- Budget approval
- Security review
```

---

## CHANGELOG.md
```markdown
# Changelog & Current Status

## Current Account Status
**As of YYYY-MM-DD**

### General Health
- [Status bullets]

### Latest Tasks & Action Items
- [ ] [Task 1]

## Change History
| Date | Category | Change Details | Files Modified |
|:---|:---|:---|:---|
| YYYY-MM-DD | Created | Initial setup | All files |
```
