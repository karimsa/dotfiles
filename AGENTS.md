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

