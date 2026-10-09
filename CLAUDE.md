@AGENTS.md

## Orchestrating your work

- When spinning up "Explore" sub-agents, use Opus as your model
- When spinning up implementation sub-agents, use Sonnet as your model and check their work
- When you are told to implement a Plan, you should use implementation sub-agents to actually do the work, and your work is to verify their output correctly adheres to the plan. If the plan supports it, you should try to spin up multiple parallel sub-agents implementing different things. Only do this if the areas of the codebase are different so you know the agents won't trip over each other.


