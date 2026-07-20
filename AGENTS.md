# GBA Emulator

A Game Boy Advance emulator project, managed via three-tier progress tracking.

## Project Management Model

- **Checkpoints** (daily) — one thing per session, logged in `docs/DAILY_LOG.md`
- **Milestones** (weekly) — defined ad-hoc at Monday start or Friday review
- **Releases** (versioned) — declared when milestones cohere into shippable whole

Agents own `docs/`. The user owns `journal/`.

## Your Job Each Session

1. Read `docs/PROGRESS.md` and `docs/DAILY_LOG.md` for context
2. Propose a weekly milestone breakdown into 5 checkpoints if starting a new week
3. Create/modify only `docs/`, `src/`, and config files
4. Never write to `journal/` — that's the user's space

## Weekly Calendar (IST)

| Day | Time | Event |
|---|---|---|
| Mon–Thu | 10:00–11:45 | 3×25min focus blocks |
| Fri | 14:00–15:00 | Weekly review |
| Sat | 10:00–12:00 | Architecture/refactoring |
| Sun | 10:00–12:00 | Testing/documentation |
| Sun | 16:00–17:00 | Journal entry (user) |
| Every other Fri | 15:00–15:30 | Milestone check-in |

## Agent skills

### Issue tracker
GitHub Issues — issues and PRDs live as GitHub issues. See `docs/agents/issue-tracker.md`.

### Triage labels
Five canonical triage roles: `needs-triage`, `needs-info`, `ready-for-agent`, `ready-for-human`, `wontfix`. See `docs/agents/triage-labels.md`.

### Domain docs
Single-context layout — one `CONTEXT.md` + `docs/adr/` at repo root. See `docs/agents/domain.md`.

## Milestone Philosophy

No pre-defined milestones. Each week's goal is decomposed from what was learned the previous week. Agents should propose milestone breakdowns, not dictate them. The user approves or adjusts.
