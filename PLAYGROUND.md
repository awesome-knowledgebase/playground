# Scenario map

Repo: https://github.com/awesome-knowledgebase/playground

## Ready now (authored by `taehalim`)

| # | Title | Try this |
|---|---|---|
| 1 | `[own] Clarify onboarding…` | As `taehalim`: Approve / Request changes should be unavailable |
| 2 | `[draft] WIP glossary…` | Draft affordances |
| 3 | `[stack-a] …sources` | Bottom of Graphite stack |
| 4 | `[stack-b] …concept` | Stack navigation (base = stack-a branch) |
| 5 | `[conflict] Extend review protocol` | Conflict UX |
| 6 | `[discussion] Add reviewer checklist` | Line + summary comments, then Finish review |

## Needs peer login (one-time)

Branches are seeded. Open them **as the peer account** so `taehalim` can Approve / Request changes / Comment on someone else’s PR:

```sh
gh auth login -h github.com -p https -w   # choose stray-fizz, then later taeha-bot
cd $(gh repo clone awesome-knowledgebase/playground -- --path /tmp/akb && echo /tmp/akb)
./scripts/open-peer-prs.sh
```

| Branch | Expected author | Decision to practice as `taehalim` |
|---|---|---|
| `scenario/peer-stray-fizz-approve-me` | stray-fizz | Approve |
| `scenario/peer-stray-fizz-fix-me` | stray-fizz | Request changes |
| `scenario/peer-stray-fizz-comment-me` | stray-fizz | Comment |
| `scenario/peer-taeha-bot-approve-me` | taeha-bot | Approve |
| `scenario/peer-taeha-bot-fix-me` | taeha-bot | Request changes |

## Cross-product checklist

For one `[peer]` Approve PR, in each of GitHub / Graphite / Cursor:

1. Open the PR
2. Choose **Approve**, submit
3. Refresh GitHub Conversation — expect an Approving review
4. Repeat on Fix-me with **Request changes**, on Comment-me with **Comment**
5. On `[own]` confirm Approve is blocked
