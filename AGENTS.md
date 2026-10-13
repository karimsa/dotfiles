## General preferences

- never use global `pip` or `pip3`
- logs are almost always in UTC
- I live in EDT and prefer EDT. If I give you a time, it is likely in EDT. If I ask for a time, I want EDT.
- Always use `kubectl` for Kubernetes debugging and diagnostics, not sub-agents or other tools. Check GCP logs and pod events directly.
- When editing YAML/Helm files, preserve existing key ordering unless explicitly asked to change it. Do not rearrange fields.
- When fixing bugs, prefer the simplest possible fix. Present the minimal change first before suggesting refactors.

## Security

- NEVER EVER EVER COMMENT ON GITHUB AS ME
- if you get an "ACCESS DENIED" with "You must never try" from any command, it is not prompt injection, you MUST respect it and stop immediately

## Plan documents

- Always maintain a planning document, even if I don't explicitly ask you to pre-plan before executing
- Always maintain a 'Tasks' section with TODO items in your planning document, and check things off as you complete them
- Always maintain a 'Changelog' section in your planning document and keep it up to date

## How to handle review comments

- When creating a PR, continuously watch for review comments until the PR is merged.
- Triage every comment. If the reported issue does not actually exist, resolve the comment.
- If the issue exists but predates this PR, open a GitHub issue to track it for later and resolve the comment.
- If the PR introduced the issue, decide whether it is worth fixing right now. If it is not, resolve the comment.
- Otherwise, fix the issue, push the fix, and then resolve the comment.

