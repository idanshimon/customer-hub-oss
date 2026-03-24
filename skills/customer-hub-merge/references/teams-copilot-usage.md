# Teams Copilot Prompt — Usage Notes

## How to Use

1. Open a Teams meeting recap
2. Open the Copilot sidebar
3. Copy the entire contents of `teams-copilot-prompt.md`
4. Replace `[CUSTOMER_NAME]` with the customer name (e.g., "Acme Corp", "Contoso")
5. Paste into Copilot and send
6. Copy Copilot's output and paste it to your AI assistant — it will merge it into the customer hub

## Follow-up Prompts

If output gets cut off:
```
Continue from where you left off
```

If technical details are thin:
```
What specific technical details, numbers, tools, platforms, and infrastructure were discussed?
```

If speaker identification is weak:
```
List every person who spoke, their company, and what topics they discussed
```

## Notes

- Teams Copilot has a response length limit — you may need the "continue" follow-up
- The prompt leverages Teams metadata (date, time, attendees) so those fields should always be filled
- Output uses `=== FILE: ... ===` headers so your AI assistant can parse and route to the right customer hub files
