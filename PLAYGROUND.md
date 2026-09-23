# Scenario map — Review / CI / Merge

Repo: https://github.com/awesome-knowledgebase/playground

Inspect the same PR in **GitHub → Graphite → Cursor**. Graphite shows three header signals: **Review status**, **CI status**, **Merge status**.

## Review status

| Case | How to see it | PR |
|---|---|---|
| Needs your review | You are requested reviewer, no decision yet | peer Approve/Fix/Comment |
| Returned to you | Your PR has Request changes | #1, #6 |
| Waiting for reviewers | Your open PR, reviews outstanding | stack / own without verdict |
| Waiting for author | You requested changes on someone else’s PR | after you Request changes on a peer Fix-me |
| Approved (section) | Your PR has required approval, not merged | `[ready] Approved — merge when ready` |
| Comment-only review | Peer left Comment (no approve/block) | see reviews on discussion |
| Draft | Not ready for review | #2 |
| Own-PR decision lock | Author cannot Approve / Request changes | #1 as taehalim |

## CI status

| Case | Marker | PR title prefix |
|---|---|---|
| Passing | no marker files | `[ci-pass]` |
| Failing | `knowledge/.fail-ci` | `[ci-fail]` |
| Pending / in progress | `knowledge/.slow-ci` (≈3 min) | `[ci-pending]` |
| No checks | older PRs before workflow | #1–#6 historically empty until new push |

## Merge status

| Case | Cause | PR |
|---|---|---|
| Blocked — review | Branch protection requires 1 approval | most open PRs |
| Blocked — failing CI | Required check fails (after protection update) | `[ci-fail]` |
| Conflict / dirty | Diverged from main | #5 |
| Ready / clean | Approved + CI green + no conflict | `[ready]` when checks finish |
| Merged / recently merged | Landed on main | `[merged]` sample |
| Closed | Closed without merge | `[closed]` sample |
| Stack base vs upstack | #3 base main, #4 base stack-a | #3 / #4 |

## Suggested Graphite walk (status trio)

1. Open `[ready]` — Review=Approved, CI=pass, Merge=ready  
2. Open `[ci-fail]` — CI=fail, Merge blocked  
3. Open `[ci-pending]` while job runs — CI=pending  
4. Open #5 — Merge=conflict  
5. Open #1 — Review=Changes requested (Returned to you)  
6. Open a peer Fix-me after you Request changes — Waiting for author  
