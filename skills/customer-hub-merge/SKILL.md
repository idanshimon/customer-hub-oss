---
name: customer-hub-merge
description: Extract and merge customer data from AI conversations into the customer-hub project. Also used for processing meeting transcripts pasted directly into chat, updating personas, org trees, architecture docs, and opportunity history. Use when the user wants to extract customer meeting transcripts, conversations, or notes from an AI assistant and import them into the customer hub. Supports both new customer creation and merging data into existing customer folders while preserving existing context.
---

# Customer Hub Data Extraction & Merge

Extract customer data from AI conversations and merge it into the customer-hub repository.

## Prerequisites

Before using this skill, ensure:
1. User has loaded the customer-hub project context
2. The customer-hub AGENTS.md and docs/AGENT_INSTRUCTIONS.md are read and understood

## Workflow

### Phase 1: Generate Extraction Prompt

When user wants to extract data for a customer from an AI conversation:

1. Read [extraction-prompt.md](references/extraction-prompt.md)
2. Replace `[CUSTOMER_NAME]` with the actual customer name
3. Provide the customized prompt to the user to paste into their AI conversation

**User action**: User copies the prompt, pastes it into their AI thread about the customer, and gets structured markdown output.

### Phase 2: Prepare for Merge

When user is ready to paste the extraction output:

1. Read [merge-protocol.md](references/merge-protocol.md) to understand the merge strategy
2. Load customer-hub project context if not already loaded
3. Normalize customer name to slug format (lowercase, hyphen-case)
4. Check if `cust/<customer-slug>/` exists
5. If exists: Read ALL existing context files (index.md, personas.md, architecture.md, opp-history.md, meeting-notes/*)
6. If doesn't exist: Run `./scripts/add_customer.sh <customer-slug>` to create the structure

### Phase 3: Process Extraction Output

When user pastes the AI output:

1. Parse the output (should have `=== FILE: <filename> ===` headers)
2. For each file, apply the merge strategy from merge-protocol.md:
   - **index.md**: Combine meeting lists chronologically, merge action items
   - **personas.md**: Add new people, augment existing people (don't replace)
   - **architecture.md**: Preserve structure, add new findings to sections
   - **opp-history.md**: Update opportunities, preserve timeline
   - **meeting-notes/*.md**: Create new files, merge on date conflicts

3. Use the `write` or `edit` tool to create/update files

4. Handle conflicts:
   - Auto-merge when additive or clearly newer data
   - Ask user when contradictory or unclear

### Phase 4: Update Tracking

After merging all files:

1. Update `cust/<customer-slug>/context/CHANGELOG.md`:
   - Rewrite "Current Account Status" section with today's date
   - Append row to "Change History" table detailing what was merged

2. Update `customers.md`:
   - Add/update customer row with appropriate Health emoji (🟢/🟡/🔴/⚪)
   - Update "Next Action" and "Status" columns

### Phase 5: Confirmation

Provide completion summary:

```markdown
✅ Merge complete for [Customer Name]

**Files Created:**
- [List new files]

**Files Updated:**
- [List updated files with brief description of changes]

**Conflicts/Questions:**
[None / List any items needing user decision]
```

## Key Rules from customer-hub Project

- **Customer isolation**: Never mix data between customer folders
- **Source of truth**: Context files are authoritative
- **Multi-pass extraction**: Meeting notes + context updates (personas/architecture/opp)
- **Changelog protocol**: Always update CHANGELOG.md after changes
- **Python venv**: If running scripts, activate `.venv` first

## Common Use Cases

### New Customer Extraction

User says: "Extract Acme data from ChatGPT"
1. Provide extraction prompt with customer name filled in
2. User pastes into ChatGPT, gets output
3. User pastes output back
4. Create customer folder, process all files, update tracking

### Updating Existing Customer

User says: "Merge new meeting notes from ChatGPT"
1. Provide extraction prompt
2. User gets AI output, pastes it back
3. Read existing context files first
4. Merge new data preserving existing content
5. Update CHANGELOG and customers.md

### Quick Prompt Only

User says: "Give me the extraction prompt for Acme Corp"
1. Read extraction-prompt.md
2. Replace `[CUSTOMER_NAME]` with "Acme Corp"
3. Provide customized prompt
4. Done (user will come back later with output)

## Reference Files

- **[extraction-prompt.md](references/extraction-prompt.md)**: Full AI extraction prompt template (for pasting into AI conversations with history)
- **[teams-copilot-prompt.md](references/teams-copilot-prompt.md)**: Shorter Teams Copilot-optimized prompt (for use inside Teams meeting recaps — Copilot already has date/speakers/transcript)
- **[merge-protocol.md](references/merge-protocol.md)**: Detailed merge strategies and conflict resolution rules

### Which template to use:
- **Teams meeting recap** → `teams-copilot-prompt.md` (shorter, leverages Teams metadata)
- **AI conversation with notes** → `extraction-prompt.md` (full template, no meeting metadata available)
