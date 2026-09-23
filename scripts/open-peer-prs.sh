#!/usr/bin/env bash
# Run while authenticated as stray-fizz OR taeha-bot:
#   gh auth login -h github.com -p https -w
#   ./scripts/open-peer-prs.sh
set -euo pipefail
REPO=awesome-knowledgebase/playground
ACTOR=$(gh api user --jq .login)
case "$ACTOR" in
  stray-fizz|taeha-bot) ;;
  *)
    echo "Logged in as $ACTOR — switch to stray-fizz or taeha-bot first." >&2
    exit 1
    ;;
esac

open_pr() {
  local head="$1" title="$2" body="$3"
  if gh pr list --repo "$REPO" --head "$REPO:$head" --json number --jq 'length' | grep -qx 0; then
    :
  else
    echo "exists: $head"
    return
  fi
  git fetch origin "$head"
  git checkout -B "$head" "origin/$head"
  git commit --allow-empty -m "Open as $ACTOR"
  git push origin "HEAD:$head"
  gh pr create --repo "$REPO" --base main --head "$head" --title "$title" --body "$body"
}

if [[ "$ACTOR" == "stray-fizz" ]]; then
  open_pr scenario/peer-stray-fizz-approve-me \
    "[peer] Approve-me — stray-fizz authored Concept" \
    "## Scenario tag
peer / approve

Inspector (taehalim): submit **Approve** here from GitHub, Graphite, and Cursor."
  open_pr scenario/peer-stray-fizz-fix-me \
    "[peer] Fix-me — stray-fizz incomplete Concept" \
    "## Scenario tag
peer / request_changes

Inspector (taehalim): submit **Request changes**."
  open_pr scenario/peer-stray-fizz-comment-me \
    "[peer] Comment-me — stray-fizz informational note" \
    "## Scenario tag
peer / comment

Inspector (taehalim): submit **Comment** only."
fi

if [[ "$ACTOR" == "taeha-bot" ]]; then
  open_pr scenario/peer-taeha-bot-approve-me \
    "[peer] Approve-me — taeha-bot authored Concept" \
    "## Scenario tag
peer / approve

Inspector (taehalim): submit **Approve**."
  open_pr scenario/peer-taeha-bot-fix-me \
    "[peer] Fix-me — taeha-bot incomplete Concept" \
    "## Scenario tag
peer / request_changes

Inspector (taehalim): submit **Request changes**."
fi

echo "Done as $ACTOR"
gh pr list --repo "$REPO"
