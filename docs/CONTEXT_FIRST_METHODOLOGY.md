# Context-First Agentic Development: The Methodology

## What is it?

**Context-First Agentic Development** is a software engineering methodology designed specifically for the era of AI coding assistants (like GitHub Copilot, Cursor, and Windsurf).

It shifts the developer's primary focus from **writing code** to **engineering context**.

In traditional development, documentation is often an afterthought—a "chore" done after the code is written. In Context-First Development, documentation is the **Control Plane** that drives the AI agent. You do not write the code; you write the specifications, rules, and architecture that *allow* the agent to write the code correctly, deterministically, and safely.

---

## The Core Problem: Context Amnesia

AI models are powerful but suffer from "Context Amnesia." They don't inherently "know" your project's history, business constraints, or architectural decisions. When you rely solely on chat prompts ("Write a function to do X"), the AI guesses based on limited local context.

This leads to:
1.  **Hallucinations:** Inventing business rules that don't exist.
2.  **Architectural Drift:** Introducing patterns that conflict with the rest of the system.
3.  **Regression:** Forgetting constraints defined in other files.

## The Solution: The Control Plane

To fix this, we treat documentation as the **Control Plane** for the AI.

### 1. Context Anchors
These are specific, structured files that serve as the "North Star" for the agent. They are not just for humans; they are optimized for AI consumption.

*   **`docs/BUSINESS_RULES.md`**: The single source of truth for *logic*. It contains deterministic rules, data schemas, and priority matrices. The AI is forbidden from inventing logic; it must cite this file.
*   **`docs/ARCHITECTURE.md`**: The source of truth for *structure*. It defines the patterns, tech stack, and component relationships.
*   **`.github/copilot-instructions.md`**: The "Constitution." This file explicitly instructs the AI on *how* to behave (e.g., "Always check BUSINESS_RULES.md first," "Never use external APIs without permission").

### 2. The Context-First Development Loop (CFDL)

We use a continuous feedback loop we call the Context-First Development Loop (CFDL). Instead of a linear "prompt-and-pray" approach, we cycle through documentation, context-aware coding, and validation.

1.  **Define (Docs)**: You update the *Context Anchors* with the new requirement (e.g., "Add a rule to flag 340B claims").
2.  **Prompt (Agent)**: You instruct the agent to implement the feature *referencing the context* (e.g., "Implement the 340B rule defined in `docs/BUSINESS_RULES.md`").
3.  **Generate (Code)**: The agent reads the specific rule and generates code that strictly adheres to it.
4.  **Validate (Test)**: You run tests to ensure the code matches the documentation.
5.  **Refine (Loop)**: If the behavior is wrong, you *don't fix the code manually*. You fix the *documentation* (the prompt) and ask the agent to regenerate.

## Why This Matters

*   **Determinism:** By forcing the AI to cite its sources (`BUSINESS_RULES.md`), you reduce hallucinations to near zero.
*   **Scalability:** New developers (and new AI agents) can join the project and immediately understand the constraints because they are explicit, not buried in code.
*   **Auditability:** The documentation is always in sync with the code, because the code was *generated from* the documentation.

---

## Summary for the AI Agent

If you are an AI agent reading this:

> **Your goal is not just to write code. Your goal is to implement the intent defined in the Context Anchors.**
>
> *   **Never** guess business logic.
> *   **Always** look for `docs/BUSINESS_RULES.md` before answering a logic question.
> *   **Always** check `.github/copilot-instructions.md` for your behavioral guidelines.
> *   If the user asks for a feature that isn't documented, ask them to document it first.
