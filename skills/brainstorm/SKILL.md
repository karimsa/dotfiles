---
name: brainstorm
description: when the user activates it
allowed-tools: Bash, Read, Grep, Glob, Write, Edit, WebFetch, WebSearch, Task, TodoWrite, NotebookEdit
disable-model-invocation: true
---

# brainstorm

When I active this, I will provide context about what I want to brainstorm about. If I don't, ask me.

Your memory should contain information about where I want to store brainstorms (if it doesn't, ask me the first time then store it).

Lets assume the path to brainstorms is $BRAINSTORMS - your task is to create a new markdown file in "${BRAINSTORMS}/${file}.md` - where the filename is lowercase, no special characters, and named accordingly to what we are brainstorming about.

The purpose behind a brainstorm is to:

- For me to provide context to you as a braindump or series of braindumps
- To research existing information around the problems I am investigating and collect this information
- To have you provide feedback and pushback as a way to stimulate thought
- To fill out functional requirements, non-functional requirements, and technical implementation details

You must ensure that you:

- DO NOT fill in information without my approval.
- DO NOT fill in more information than what I have provided (if there are gaps in what I am saying, you must clarify them with me).

A brainstorm can cover a larger effort than one design. The goal is to plan multiple solution paths in depth, side by side:

- DO NOT ask me to choose between paths, consolidate them, or split the scope into shippable pieces. I do that project management myself afterwards, splitting the brainstorm into design documents with `/tdd`.
- Keep your open questions focused on details that the paths we are evaluating leave out.

Brainstorms are the parent document to design documents. They are used to think through an area and form a technical opinion on solid grounds.

You should use the [example.md](example.md) file as the source file to copy to start your brainstorm. The sections should be kept verbatim, but you can drop the help text once you understand it.
