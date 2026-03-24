---
name: livemeeting
description: "Live meeting assistant. Paste live transcription chunks and get real-time summaries, context, action items, and follow-up suggestions. Use when user says 'livemeeting', 'live meeting', or starts pasting transcript chunks during an active call."
user-invocable: true
---

# Live Meeting Skill

## When to Activate
User is in an active meeting and pasting transcript chunks in real-time.

## Behavior

### On Each Transcript Paste:
1. **Quick Summary** (2-3 sentences) — What was just discussed
2. **Key Points** — Bullet the important things said, by whom
3. **Decisions Made** — Any commitments, agreements, or choices
4. **Action Items** — [Owner] Task — Due date if mentioned
5. **Open Questions** — Unresolved items or things that need follow-up
6. **💡 Context** — Connect what was said to existing customer knowledge (prior meetings, architecture, personas, blockers)
7. **🎯 Your Move** — If there's something the user should say, ask, or follow up on RIGHT NOW while still in the meeting

### Rules:
- **Be fast.** User is in a live meeting. Short, scannable, no fluff.
- **Accumulate context.** Each paste builds on prior ones in the same session. Track the running thread.
- **Flag contradictions.** If someone says something that conflicts with prior meetings or decisions, call it out.
- **Track new people.** If a new name appears, note it and infer role from context.
- **Don't repeat.** Only surface NEW information from each chunk.
- **Bold the important stuff.** User is glancing at this while listening.

### Running State (maintained across pastes in session):
- **Decisions log** — All decisions made this meeting
- **Action items** — Running list
- **Key topics covered** — For meeting note generation
- **New intel** — Things we didn't know before this meeting

### On "wrap up" or meeting end:
Generate a full meeting note in customer-hub format ready to save.

## Format Template

```
## 📍 [Timestamp/Chunk #]

**Summary:** [2-3 sentences]

**Key Points:**
- [Speaker]: [point]

**Decisions:** [if any]
**Actions:** [if any]  
**Open:** [if any]

💡 **Context:** [connection to prior knowledge]
🎯 **Your Move:** [what to say/ask now, if anything]
```
