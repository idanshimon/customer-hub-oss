# Customer Data Extraction Prompt Template

Paste this prompt into Microsoft Copilot or ChatGPT conversations to extract all customer data:

---

I need you to analyze our entire conversation history and extract all customer information to populate my Microsoft Customer Hub repository.

**Customer Name:** [CUSTOMER_NAME]

Please generate the following markdown files with ALL information from our conversations (meeting transcripts, notes, discussions, images descriptions):

---

## CRITICAL: Date & Time Extraction

**You MUST extract the actual meeting date and time.** Look for:
- Teams transcript header (contains date, start time, end time)
- Calendar invite metadata
- Transcript timestamps (first and last timestamp = meeting duration)
- Any date references in the conversation ("today is...", calendar context)
- If a Teams transcript title says "Meeting on March 4, 2026" — use that date

**File naming MUST use the actual date:** `YYYY-MM-DD_short-topic.md`
**Never use `[NOT DISCUSSED]` for dates if timestamps exist in the transcript.**
**Calculate meeting duration** from first to last transcript timestamp.

---

## CRITICAL: Speaker Identification

Teams transcripts often show "Speaker 1", "Speaker 2", "Guest-1", etc. You MUST:
1. Map speakers to real names using context clues (introductions, name mentions, role references)
2. If a speaker says "I'm Chris from Optum" — that speaker = Chris for the rest of the transcript
3. If speakers cannot be identified, label them as "Unknown Speaker 1" etc. and note what clues exist
4. List the speaker mapping at the top of meeting notes

---

## CRITICAL: Clean Output

- No terminal escape codes, ANSI sequences, or rendering artifacts
- Pure markdown only
- No `#[...` sequences or broken characters

---

## FILE 1: index.md

```markdown
# [CUSTOMER_NAME] - Context Dashboard

## Overview
[Write 2-3 paragraph summary: customer's business, industry, size, our engagement status, current projects]

## Customer Hub Slug
[Lowercase hyphen-case folder name for this customer, e.g., "unitedhealth", "hca", "cigna"]

## Stakeholders
[View Personas](personas.md)

## Architecture
[View Architecture & Tech Stack](architecture.md)

## Objectives / Opportunities
[View Opportunity History](opp-history.md)

## Recent Meeting Notes
[List ALL meetings discussed in our conversation, format:]
- [YYYY-MM-DD Meeting Topic](meeting-notes/YYYY-MM-DD_meeting-topic.md)

## Action Items
[Extract ALL open action items mentioned anywhere in our conversation:]
- [ ] [Owner Name] Action description - Due: YYYY-MM-DD
- [ ] [Owner Name] Another action

## Quick Links
- [Architecture](architecture.md)
- [Opp History](opp-history.md)
- [Meeting Notes Folder](meeting-notes/)
```

---

## FILE 2: personas.md

Separate people into clear sections: **Customer Team**, **Microsoft Team**, and **Partners/Vendors**.

```markdown
# [CUSTOMER_NAME] - Key Stakeholders & Personas

## Customer Team

### Executive Sponsors
#### [Name] - [Title]
- **Department:** [Department/Division]
- **Role in Engagement:** [Their role]
- **Priorities:** [What they care about]
- **Contact:** [Email/Phone if mentioned]
- **Notes:** [Communication style, preferences, key quotes]

### Technical Leads
[Same format for each technical contact]

### Project Team
[Same format for PMs, developers, architects]

### Decision Makers
[Who has budget authority, technical approval, vendor selection power]

## Microsoft Team

[For EVERY Microsoft person mentioned:]
#### [Name] - [Title/Role]
- **Email:** [if mentioned]
- **Phone:** [if mentioned]
- **Focus:** [What they do in this engagement]
- **Notes:** [Key observations]

## Partners / Vendors

[For any SI, ISV, or third-party people mentioned:]
#### [Name] - [Title]
- **Organization:** [Company name]
- **Role:** [What they do]

## Relationship Map
[Describe org dynamics, reporting structure, who influences whom, key dependencies between teams]
```

---

## FILE 3: architecture.md

```markdown
# [CUSTOMER_NAME] - Architecture & Tech Stack

## Current Environment
### Cloud Infrastructure
[AWS/Azure/GCP usage, multi-cloud strategy]

### On-Premises
[Data centers, legacy systems]

### Development Stack
[Languages, frameworks, CI/CD tools]

### Data Platform
[Databases, data warehouses, analytics tools]

## Microsoft Footprint
### Currently Using
[List all Microsoft products/services mentioned]

### Licensing
[E3/E5, CSP, EA details if discussed]

## Technical Challenges
[Every pain point, bottleneck, technical debt item mentioned]

## Integration Points
### Internal Systems
[APIs, data flows between systems]

### Third-Party Integrations
[External vendors, SaaS tools]

## Security & Compliance
[Requirements: HIPAA, SOC2, FedRAMP, data residency, etc.]

## Future State Vision
[Modernization goals, cloud migration plans, AI/ML initiatives]

## Diagrams/Visual Context
[Describe any architecture diagrams or technical images shared]
```

---

## FILE 4: opp-history.md

```markdown
# [CUSTOMER_NAME] - Opportunity History

## Active Opportunities
### [Opportunity Name/ID]
- **Products:** [GitHub Copilot, Azure OpenAI, etc.]
- **Value:** $[Amount] ARR
- **Stage:** [Discovery/POC/Negotiation/Closed]
- **Close Date:** YYYY-MM-DD
- **Champion:** [Internal sponsor]
- **Competition:** [AWS/GCP/other vendors]
- **Status:** [Current state]

[Repeat for each active opportunity]

## Past Wins
### [Project Name] - [Date]
- **What:** [What we sold/delivered]
- **Why it worked:** [Success factors]
- **Value delivered:** [Business outcome]

## Past Losses / Stalls
### [Project Name] - [Date]
- **What happened:** [Why we lost/stalled]
- **Competitor:** [Who won]
- **Lessons learned:** [What to do differently]

## Pipeline
### Near-term (Next 3 months)
[Upcoming opportunities with high probability]

### Long-term (6-12 months)
[Strategic expansion areas, future projects]

## Competitive Landscape
[AWS presence, Google Cloud, other vendors, their strengths/weaknesses]
- List only competitors that have been explicitly mentioned in meetings or documents for this customer.

## Budget & Procurement
[Fiscal year, budget cycles, procurement process, approvers]

## Risks / Blockers
[Any blockers, dependencies, or risks to deal progression]
```

---

## FILE 5+: Meeting Notes (create one per meeting)

For EACH meeting/call mentioned in our conversation, create a separate file:

```markdown
# [CUSTOMER_NAME] - [Meeting Topic]

**Date:** YYYY-MM-DD (extracted from transcript/calendar — NEVER use [NOT DISCUSSED] if timestamps exist)
**Time:** HH:MM - HH:MM [timezone] (from first/last transcript timestamp)
**Duration:** [X] minutes
**Type:** [Discovery / Technical Review / Demo / Follow-up / Executive Briefing / Architecture Review]
**Attendees:**
- [Name] - [Title/Company] (Customer)
- [Name] - [Title/Company] (Microsoft)
- [Name] - [Title/Company] (Partner)

## Speaker Map
[If transcript uses Speaker 1/2/Guest-1 etc., map them here:]
- Speaker 1 / Guest-1 = [Name] (identified by: [how you figured it out])
- Speaker 2 / Guest-2 = [Name] (identified by: [clue])

## Objective
[Why we met, what we wanted to accomplish]

## Pre-Meeting Context
[Any relevant background or setup]

## Discussion Summary
[Detailed notes from the transcript - key points, questions asked, topics covered]

### Key Topics
1. **[Topic 1]:** [Discussion details]
2. **[Topic 2]:** [Discussion details]

## Technical Details
[Any technical specs, requirements, architecture discussed]

## Questions Raised
[Questions from customer or Microsoft]

## Answers/Responses
[How we addressed their questions]

## Decisions Made
[Any commitments, agreements, or decisions]

## Concerns/Objections
[Customer hesitations, blockers, risks]

## Wins/Positive Signals
[Enthusiasm, buy-in, progress indicators]

## Action Items
- [ ] [Owner] Action description - Due: YYYY-MM-DD
- [ ] [Owner] Another action - Due: YYYY-MM-DD

## Next Steps
[What happens after this meeting]

## Quotes
[Notable customer quotes that reveal priorities/concerns]

## Notes
[Additional observations, relationship dynamics, tone]

## Attachments/References
[Describe any slides, diagrams, or documents discussed]
```

---

## FILE 6: CHANGELOG Entry

Generate a changelog row for the merge:

```markdown
| YYYY-MM-DD | [Your Name] | [Brief description of what was extracted and from which meeting/source] |
```

---

**IMPORTANT INSTRUCTIONS:**

1. **Extract EVERYTHING**: Don't summarize - include all details from meeting transcripts, notes, and image descriptions
2. **Use actual dates**: Extract from transcript metadata, timestamps, calendar headers. If the transcript shows `[11:08:58]` as the first timestamp and `[11:45:50]` as the last, the meeting was ~37 minutes. If a Teams transcript header says "March 4, 2026" — use `2026-03-04`.
3. **Name every person**: Include everyone mentioned with their role. Separate Customer / Microsoft / Partner.
4. **Map speakers**: If transcript uses "Speaker 1" or "Guest-1", identify who they are from context and create a speaker map.
5. **Quote directly**: Use customer quotes when possible to capture their language
6. **Be specific**: "They use AWS" → "They run production workloads on AWS EC2 with RDS PostgreSQL databases"
7. **Mark unknowns**: If info wasn't discussed, write `[NOT DISCUSSED]` instead of guessing. But NEVER mark dates as `[NOT DISCUSSED]` if timestamps or metadata exist.
8. **File naming**: Use format: `YYYY-MM-DD_short-topic-name.md` with the ACTUAL date
9. **Clean output**: No terminal escape codes, ANSI sequences, or rendering artifacts. Pure markdown only.
10. **Customer Hub slug**: Include the lowercase hyphen-case folder name in index.md

**OUTPUT FORMAT:**
- Provide each file with a clear header like `=== FILE: index.md ===`
- Use markdown formatting
- Make each file ready to copy-paste directly

Ready? Extract all data now.
