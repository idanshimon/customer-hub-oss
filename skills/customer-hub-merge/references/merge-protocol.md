# Merge Protocol for Customer Data

When ChatGPT provides extracted customer data, follow this protocol to merge it into the customer-hub repository.

## Pre-Merge: Check Current State

1. **Identify customer slug**: Normalize customer name to lowercase hyphen-case (e.g., "Elevance Health" → "elevance")

2. **Check if customer folder exists**:
   ```bash
   ls ./cust/<customer-slug>/
   ```

3. **If folder doesn't exist**:
   - Create it using the add_customer.sh script:
     ```bash
     cd the repo root
     ./scripts/add_customer.sh <customer-slug>
     ```
   - This creates the base structure with CHANGELOG.md

4. **If folder exists**:
   - Read ALL existing files in `cust/<customer-slug>/context/` first:
     - index.md
     - personas.md
     - architecture.md
     - opp-history.md
     - All files in meeting-notes/
   - This is CRITICAL to avoid overwriting existing data

## Merge Strategy by File Type

### index.md

**Merge approach**: Combine and augment

1. **Overview section**: 
   - If existing overview exists, preserve it
   - Add new details from extraction
   - Prefer more recent/detailed descriptions

2. **Meeting Notes list**:
   - Combine both lists
   - Sort chronologically (oldest → newest)
   - Remove duplicates (same date + same topic)

3. **Action Items**:
   - Combine both lists
   - Mark completed items if mentioned as done
   - Preserve all open items

### personas.md

**Merge approach**: Add new, update existing

1. **For new people**: Add them to appropriate section (Executive/Technical/Project Team)

2. **For existing people**:
   - Keep existing information
   - ADD new details (don't replace)
   - Update contact info if new data is more complete
   - Preserve all notes and quotes

3. **Organization**:
   - Maintain section headers (Executive Sponsors, Technical Leads, etc.)
   - Keep people within their original sections unless role changed

**Example**:
```markdown
Existing:
### John Smith - VP Engineering
- **Department:** IT
- **Notes:** Prefers email communication

New extraction:
### John Smith - VP Engineering
- **Priorities:** Cloud migration, cost reduction

Merged:
### John Smith - VP Engineering
- **Department:** IT
- **Priorities:** Cloud migration, cost reduction
- **Notes:** Prefers email communication
```

### architecture.md

**Merge approach**: Preserve structure, augment sections

1. **For each section** (Cloud Infrastructure, Development Stack, etc.):
   - Keep existing bullet points
   - Add new findings
   - Don't remove existing info unless contradictory

2. **For contradictory information**:
   - Note both versions with dates if possible
   - Example: "Previously using AWS EC2 (as of Q1). Now migrating to Azure VMs (as of Q3)."

3. **Technical Challenges**:
   - Append new challenges
   - Mark resolved challenges as "[RESOLVED as of DATE]" instead of deleting

### opp-history.md

**Merge approach**: Timeline preservation

1. **Active Opportunities**:
   - If opportunity ID matches: Update status/stage/value
   - If new opportunity: Add to active list
   - If existing opportunity closed: Move to Past Wins/Losses

2. **Past Wins/Losses**:
   - Preserve all history
   - Add new entries chronologically

3. **Pipeline**:
   - Update near-term and long-term sections
   - Remove items that moved to Active

### meeting-notes/*.md

**Merge approach**: Create new files, merge on date conflicts

1. **For new meeting dates**: Simply create the new file

2. **For same-date conflicts**:
   - Check if it's the same meeting (compare attendees, topic)
   - If same meeting: Merge content (preserve all details from both)
   - If different meetings same day: Create files with suffixes:
     - `2026-02-18_morning-sync.md`
     - `2026-02-18_afternoon-review.md`

## Post-Merge: Update Tracking Files

### Update CHANGELOG.md

Location: `cust/<customer-slug>/context/CHANGELOG.md`

1. **Rewrite "Current Account Status" section**:
   ```markdown
   ## Current Account Status
   **As of 2026-02-18**

   ### 🟢 General Health
   - [Summary of current engagement state]
   - [Recent wins or progress]

   ### 📋 Latest Tasks & Action Items
   - [ ] [Top priority items from index.md]
   ```

2. **Append to "Change History" table**:
   ```markdown
   | 2026-02-18 | Data Import | Merged ChatGPT extraction: added 3 personas, updated architecture (GCP details), added 2 meeting notes | index.md, personas.md, architecture.md, meeting-notes/2026-02-15_*.md, meeting-notes/2026-02-17_*.md |
   ```

### Update customers.md

Location: `./customers.md`

1. **If new customer**: Add row to table
2. **If existing customer**: Update Health, Next Action, Status

```markdown
| Customer Name | Folder Link | Health | Next Action | Status |
|---------------|-------------|--------|-------------|---------|
| Elevance | [View](cust/elevance/context/index.md) | 🟢 | Review latest meeting notes | Active |
```

**Health indicators**:
- 🟢 Active, healthy engagement
- 🟡 Needs attention
- 🔴 At risk
- ⚪ Not started / Unknown

## Conflict Resolution Rules

### When to Ask User

Ask the user before proceeding if:

1. **Major contradictions**: Existing data says one thing, new data says opposite
2. **Deletion needed**: New data suggests old info is obsolete
3. **Structural changes**: Need to reorganize sections significantly
4. **Unclear duplicates**: Can't determine if two entries are the same

### When to Auto-Merge

Proceed automatically when:

1. **Additive changes**: New data adds to existing without conflict
2. **Clear updates**: New data is obviously more recent/complete
3. **New files**: Creating new meeting notes with unique dates
4. **Minor updates**: Contact info, titles, small details

## Execution Checklist

- [ ] Verify customer slug (lowercase, hyphen-case)
- [ ] Check if customer folder exists
- [ ] Read all existing context files (if folder exists)
- [ ] Process each file using appropriate merge strategy
- [ ] Update CHANGELOG.md (status + history)
- [ ] Update customers.md row
- [ ] Confirm completion with file summary

## Output Format

After merge, provide:

```markdown
✅ Merge complete for [Customer Name]

**Files Created:**
- cust/<customer-slug>/context/meeting-notes/2026-02-15_topic.md
- cust/<customer-slug>/context/meeting-notes/2026-02-17_topic.md

**Files Updated:**
- cust/<customer-slug>/context/index.md (added 2 meetings, updated action items)
- cust/<customer-slug>/context/personas.md (added 3 people: John Smith, Jane Doe, Bob Wilson)
- cust/<customer-slug>/context/architecture.md (added GCP details, updated dev stack)
- cust/<customer-slug>/context/opp-history.md (updated Copilot opportunity status)
- cust/<customer-slug>/context/CHANGELOG.md (updated status, added history row)

**Conflicts/Questions:**
[None / List any items needing user decision]
```
