---
name: tdd
arguments: "[brainstorm]"
description: used to create a technical design document as a local md file
allowed-tools: Bash, Read, Grep, Glob, Write, Edit, WebFetch, WebSearch, Task, TodoWrite, NotebookEdit
---

# tdd

When I activate this, I will provide context about the source brainstorm to use to write a new TDD. If I don't, ask me.

Your memory should contain information about where I want to store brainstorms (if it doesn't, ask me the first time then store it).

Lets assume the path to brainstorms is $BRAINSTORMS - you must find the relevant brainstorm file in $BRAINSTORMS to read and understand.

While a brainstorm will contain a lot of information about differing solution approaches and a lot of disjoint ideas, the TDD is meant to tell the narrative behind a problem and its solution.

The hope is that during the brainstorm phase, we will have evaluated trade-offs between approaches to the point where we have found a compelling solution path that meets our requirements. We will iterate on our brainstorm until this is true; we may start with more bare requirements, then fill them in.

When we are ready to write a design, we are looking to solidify our implementation details very well, to the point that an agent with no context other than the codebase and our design document can implement the design end to end, and test it. A human should also be able to read the design document and understand how we got to the proposed solution, what else was in consideration, and what the core problem/requirements were for this design.

You should use the [example.md](example.md) as your starter TDD document.

