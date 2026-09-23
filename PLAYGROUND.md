# Scenario map

Use these PRs to answer review-decision questions by looking, not guessing.

| PR title prefix | Author intent | What to try |
|---|---|---|
| `[own]` | Opened by the account you are logged in as | Approve / Request changes should be blocked or Comment-only (GitHub + Graphite + Cursor) |
| `[peer]` | Opened by another org member | Approve / Request changes should publish a real GitHub review verdict |
| `[draft]` | Draft PR | Finish review / merge affordances differ |
| `[stack-a]` / `[stack-b]` | Ordered related changes | Graphite stack navigation vs GitHub single PR vs Cursor |
| `[conflict]` | Conflicts with `main` | Conflict UX across surfaces |
| `[approved]` | Already has an approving review | Merge readiness / required-review state |
| `[changes-requested]` | Has a Request changes review | Blocking review UX |
| `[comment-only]` | Has Comment review only | No merge-blocking verdict |
| `[discussion]` | Line + summary comments | Comment threading / pending review batching |

## Suggested comparison checklist

For one `[peer]` PR, in each product:

- [ ] Change decision to **Approve**, submit, refresh GitHub Conversation
- [ ] On another `[peer]` PR, submit **Request changes**
- [ ] On a third, submit **Comment** only
- [ ] On your `[own]` PR, confirm Approve / Request changes is unavailable
- [ ] Confirm inbox / section movement (Needs review → Approved / Waiting for author)

## Accounts

| Login | Role in this playground |
|---|---|
| `taehalim` | Primary inspector |
| `stray-fizz` | Peer author / alternate reviewer |
| `taeha-bot` | Peer author / bot-like second identity |
