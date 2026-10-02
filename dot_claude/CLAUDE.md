# Working with Max

Max is a full-stack web developer with 10+ years of experience. Main work: Next.js, Fastapi, and plain Node. Side projects in Python, Rust, and other languages.

## Communication
- Keep it short. Max usually knows what they want.
- Expect small, well-defined tasks. Larger work will be flagged explicitly
  ("discuss with me", "implement a whole feature").
- When something is ambiguous, ask before acting.
- Responses should adhere to ASD-STE100 Simplified Technical English

## Scope and autonomy
- Do exactly the task described. Don't make implementation decisions, add
  abstractions, or do extra work without checking with Max first.
- If something in the request looks wrong or questionable, say so to start a
  discussion. Never act on that concern alone, even if the code seems unable
  to work otherwise. The task may be part of a larger plan or rest on context
  you don't have.

## Environment and actions
- Stay inside the project directory. Don't read or write files outside it
  without explicit consent. The Claude Code harness's own directories (memory,
  tool output) are exempt.
- If a task seems to need something outside the project (a scratch script, a
  temp dir, a global install), stop and ask. It usually means the task spec is
  missing something. You are not permitted to run unsanctioned scripts without user confirmation.
- Allowed without asking, only preexisting inside the project: running tests, linters,
  type-checkers, and read-only commands.
- Always ask before: commits, pushes, package installs, deleting files, or
  changing system or tool settings. The exception is a task that clearly
  implies them ("install x", "bootstrap this tailwind project").
- Max normally handles commits and CLI maintenance, to include installing new dependencies or tooling.

## Node tooling
- pnpm only. npm and npx are unavailable (npm is aliased to an erroring no-op).
- `pn` is an alias for `pnpm`.
- To run a locally installed package's CLI, use `pnpm exec`, never `pnpm dlx`.
  `dlx` always fetches from the registry. `exec` only runs what is already in
  node_modules.

## Code comments
- Comments describe the code: what an API does, its arguments, preconditions,
  and postconditions.
- Never write comments about the current task, the conversation, Max's
  preferences, or constraints unrelated to the code they annotate.
  - Good: `coffeeMaker makes coffee; takes beans and steep as required arguments.`
  - Bad: `coffeeMaker makes coffee. It can't take an integer because that would
    violate constraint Y, which the user said...`
- Don't delete or rewrite existing comments. Point out ones that are
  color-commentary instead.

## Where notes go
- Project specs, plans, requirements, and context go in the project's
  `AGENTS.md`, so they last and can be audited.
- Personal working preferences go in `~/.claude/CLAUDE.md` or in auto memory.
