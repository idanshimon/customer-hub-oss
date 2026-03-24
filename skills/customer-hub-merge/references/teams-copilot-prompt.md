STEP 1 — CALENDAR METADATA (MANDATORY, DO THIS FIRST)

Retrieve the calendar event metadata for THIS meeting. Use ONLY the calendar invite data.

Extract and output these fields before anything else:
- Meeting Title
- Meeting Date (YYYY-MM-DD)
- Start Time
- End Time
- Timezone
- Duration (minutes)
- Organizer Name
- Organizer Email
- Location
- External / Internal meeting flag
- Full invitee/attendee list with names and email domains

If the calendar event cannot be located, STOP. Output only: "Calendar event not found — cannot proceed." Do not generate any files.

STEP 2 — TRANSCRIPT ANALYSIS

After calendar metadata is confirmed, analyze the full meeting transcript and extract ALL information into the structured markdown files below. Use exact numbers only (e.g., "~800 servers" not "many servers", "~10 TB" not "large databases"). If a number is vague in the transcript, quote it as spoken.

Customer Name: [CUSTOMER_NAME]

=== FILE: meeting-notes/[YYYY-MM-DD]_[short-topic].md ===

# [CUSTOMER_NAME] - [Meeting Title from calendar]

**Date:** [YYYY-MM-DD from calendar]
**Time:** [Start] - [End] [timezone] (from calendar)
**Duration:** [minutes] (from calendar)
**Organizer:** [Name — Email] (from calendar)
**Location:** [from calendar]
**External / Internal:** [from calendar]
**Type:** [Discovery / Technical Review / Demo / Architecture Review / Follow-up / Executive Briefing]

## Attendees
[List ALL from calendar invitee list, grouped by company. Use email domain to determine affiliation. If affiliation is still unclear, write [AFFILIATION UNKNOWN] — do not guess.]

### Customer
- [Name] — [Title/Role if mentioned in transcript]

### Microsoft
- [Name] — [Title/Role if mentioned in transcript]

### Partners / Vendors
- [Name] — [Company] — [Role if mentioned]

### Affiliation Unknown
- [Name] — [email domain if available]

## Speaker Map
[Map each person who SPOKE to their name + company. Note how you identified them (self-introduction, labeled in video, context clue). Only include people who actually spoke.]

## Summary
[3-5 sentence executive summary]

## Key Topics Discussed

### 1. [Topic]
[Detailed discussion notes with specific numbers, versions, counts]

### 2. [Topic]
[Detailed discussion notes]

## Technical Details
[All architecture, infrastructure, tools, platforms, versions, sizes, counts mentioned]

## Decisions Made
[Explicit commitments or agreements]

## Concerns / Blockers
[Objections, risks, dependencies, open issues]

## Wins / Positive Signals
[Buy-in indicators, enthusiasm, progress]

## Action Items
- [ ] [Owner - Company] Action - Due: [date if mentioned]

## Notable Quotes
[Direct quotes with speaker attribution]

## Next Steps
[What happens after this meeting]

=== FILE: personas.md ===

[EVERY attendee from the calendar invite AND every speaker from the transcript MUST appear here. Group by affiliation.]

## Customer Team
### [Name] - [Title]
- **Department:** [if mentioned]
- **Role in Engagement:** [what they do / why they were in the meeting]
- **Key Points Made:** [what they said — write "Did not speak" if they were only on the invite list]
- **Contact:** [email if available from calendar]

## Microsoft Team
### [Name] - [Title/Role]
- **Focus:** [their area]
- **Key Points Made:** [what they contributed — write "Did not speak" if invite-only]

## Partners / Vendors
### [Name] - [Title] ([Company])
- **Role:** [what they do]

=== FILE: architecture.md ===

## Current Environment
### Cloud Infrastructure
[Providers, regions, services, networking]

### On-Premises
[Servers, databases, storage, counts, legacy systems]

### Development Stack
[Languages, frameworks, CI/CD, IaC tools]

### Data Platform
[Databases, sizes, warehouses, analytics]

## Microsoft Footprint
[All Microsoft products/services mentioned]

## Integration Points
[Internal systems, third-party tools, APIs, data flows]

## Security & Compliance
[Requirements, certifications, constraints]

## Technical Challenges
[Every pain point, bottleneck, blocker mentioned with specifics]

## Future State Vision
[Modernization goals, migration plans]

=== FILE: opp-history.md ===

## Active Opportunities
### [Opportunity Name]
- **Products:** [specific products]
- **Value:** [$ if mentioned, otherwise NOT DISCUSSED]
- **Stage:** [Discovery/POC/Migration/Production]
- **Close Date:** [if mentioned]
- **Champion:** [internal sponsor]
- **Competition:** [only explicitly mentioned competitors]
- **Status:** [current state]

## Competitive Landscape
[Only competitors explicitly mentioned]

## Risks / Blockers
[Deal progression risks]

## Timeline & Milestones
[Any dates or deadlines mentioned]

=== FILE: CHANGELOG ===

| [YYYY-MM-DD from calendar] | Extracted from Teams meeting: [Meeting Title from calendar] |

---

RULES:
1. Calendar event metadata is the ONLY source for date, time, duration, organizer, location. Do NOT use transcript timestamps, slide content, or title bar. Never write NOT AVAILABLE or NOT DISCUSSED for calendar fields.
2. Use email domains from the calendar invite to determine attendee affiliation (e.g., @microsoft.com = Microsoft, @optum.com = Optum). If still unclear, write [AFFILIATION UNKNOWN].
3. Every person on the calendar invite AND every person who spoke MUST appear in personas.md. Write "Did not speak" for invite-only attendees.
4. Be specific with numbers: "~800 servers" not "many servers", "~10 TB" not "large databases".
5. Quote customers directly when revealing priorities or sentiment.
6. Mark genuinely unknown non-calendar info as [NOT DISCUSSED].
7. Use the full structured format for architecture.md — do not collapse to bullet lists.
8. Use the full structured format for opp-history.md — include all fields even if NOT DISCUSSED.
9. Output clean markdown only. No terminal codes, no ANSI sequences, no escape characters (like [118;1:3u), no rendering artifacts. If the transcript contains garbled text, skip it.
10. Do not include Office profile links or search URLs. Plain text names only.
11. Do not suggest next steps or offer follow-up options at the end. Just output the files.
