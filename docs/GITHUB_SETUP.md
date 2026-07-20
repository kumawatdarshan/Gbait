# GitHub Setup Guide

> Run this once to wire up peer accountability.

## Labels

Create these labels in GitHub → Issues → Labels:

### Type
| Label | Color | Description |
|---|---|---|
| `type:feature` | `#0E8A16` | New capability |
| `type:bug` | `#D73A4A` | Behaviour mismatch |
| `type:docs` | `#006B75` | Documentation |
| `type:test` | `#FBCA04` | Testing |
| `type:refactor` | `#FEF2C0` | Architecture / cleanup |

### Priority
| Label | Color | Description |
|---|---|---|
| `priority:high` | `#B60205` | Blocking something |
| `priority:medium` | `#FFA500` | Important but not urgent |
| `priority:low` | `#BFD4F2` | Nice to have |

### Status
| Label | Color | Description |
|---|---|---|
| `status:blocked` | `#E99695` | Waiting on something |
| `status:in-progress` | `#FB8521` | Being worked on |
| `status:needs-review` | `#C2E0C6` | Ready for review |

### Dopamine
| Label | Color | Description |
|---|---|---|
| `focus-task` | `#1D76DB` | This week's one thing |
| `quick-win` | `#84B6EB` | Can finish in one session |
| `good-first-issue` | `#BFDADC` | Beginner-friendly |
| `distraction` | `#F7C6C7` | Tangential idea — park it |

## Milestones

Create in GitHub → Issues → Milestones:

| Title | Description |
|---|---|
| **v1.0** | Boot a real GBA ROM |
| **v1.1** | (future) |
| **v1.2** | (future) |
| **Backlog** | Ideas for later |

## Project Board

Create a new project (Beta) with these views:

### 1. Daily Standup
Filter: `label:focus-task` | Sort: priority | Columns: To Do → In Progress → Done

### 2. Milestone Roadmap
Group by: Milestone | Filter: no `label:distraction`

### 3. My Work
Filter: `assignee:@me` and `status:in-progress`

### 4. Blocked Items
Filter: `label:status:blocked`

### 5. Focus Queue
Filter: `label:quick-win` or `label:good-first-issue` | Exclude: `label:distraction`

## Automation (Optional)

Create a GitHub Action (`.github/workflows/accountability.yml`) to post a daily summary
of open/in-progress items. Example available on request.
