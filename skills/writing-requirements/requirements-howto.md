# How to write requirements

Consolidated from [How to Write Better Requirements](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/), published on the Modern Requirements blog. The ideas and the quoted examples are the article's, and the wording around them is a condensed restatement. Where the two differ, the article is the reference. [Source](#source) at the end links each section here to the part of the article it came from.

## Agree on the problem first

Understand and agree on what users want before designing a solution. The article argues that most requirements failures are human, not technical: a skilled team can solve a well-defined problem, and the usual failure is that nobody defined it.

## The shape of a requirement

A requirement is one complete sentence with a subject and a predicate.

> The order entry clerk shall be able to complete ten customer orders in less than an hour.

| Part                 | In the example               |
| -------------------- | ---------------------------- |
| User type            | the order entry clerk        |
| Result for that user | complete ten customer orders |
| Verifiable criterion | in less than an hour         |

A fourth part is not in the sentence: a named person responsible for implementing it.

The verb sets the obligation.

| Verb                        | Meaning                    |
| --------------------------- | -------------------------- |
| `shall` (or `will`, `must`) | Mandatory, not negotiable. |
| `should`, `may`             | A preference, optional.    |

Readers skip over `should` and `may`, so use them only when the item really is optional.

## Writing rules

1. Write one requirement per sentence. An "and" or "or" usually means two requirements, so split them.

   Poor:

   > The pilot shall be able to control the angle of climb with one hand and feel the angle of climb from the climb control.

   Better:

   > The pilot shall be able to control the aircraft's angle of climb with one hand.
   >
   > The pilot shall be able to feel the angle of climb from the climb control.

2. Start with the type of user who wants it: "The navigator shall be able to..."
3. State the result that user gets, not how the system provides it: "...view storm clouds by radar..."
4. End with a criterion a tester can check: "...at least 200 miles ahead."
5. Leave out let-out clauses: `unless`, `except`, `if necessary`, `but`. They make the requirement close to untestable.

   Poor:

   > The fire alarm shall always be sounded when smoke is detected, unless the alarm is being tested or the engineer has suppressed the alarm.

   A definite statement looks like this:

   > Each cabin crew member shall be provided a rear-facing seat.

6. Use simple, direct sentences: "The pilot shall be able to view the airspeed."
7. Keep to a small vocabulary, about 600 words, so international readers can follow. Write "change", not "reconfigure".

   > The airline shall be able to change the aircraft from business to holiday charter use in less than 12 hours.

## Wording to avoid

### Ambiguity

> The same subsystem shall also be able to generate a visible or audible caution/warning signal for the attention of the co-pilot or navigator.

This sentence has four open questions. Which subsystem is "the same" one? Is the signal visible, audible, or both? Is it a caution, a warning, or either? Does it go to the co-pilot, the navigator, or both? Name the thing and split every "or".

### Vague terms

Words: `user-friendly`, `versatile`, `flexible`, `approximately`, `as possible`.

> The print dialog shall be versatile and user-friendly.
>
> The OK status indicator lamp shall be illuminated as soon as possible after the system self-check is completed.

Replace each with a measurable value, such as a time limit in seconds.

### Possibilities

Words: `may`, `might`, `should`, `ought`, `could`, `perhaps`, `probably`.

> The reception subsystem probably ought to be powerful enough to receive a signal inside a steel-framed building.

State it as a requirement or leave it out.

### Wishful thinking

Phrases: `100% reliable`, `safe`, `handle all unexpected failures`, `never fail`, `upgradeable to all future situations`.

> The gearbox shall be 100% safe in normal operation.
>
> The network shall handle all unexpected errors without crashing.

Nobody can test these. Write the bound you can test.

### Design in the requirement

Signs: component names, materials, software objects or procedures, database fields.

> The antenna shall be capable of receiving FM signals, using a copper core with nylon covering and a waterproof hardened rubber shield.

The need is receiving FM signals. The copper, nylon, and rubber are design decisions and belong in the design.

## User requirements and system requirements

Keep these as two separate sets.

|              | User requirements                                                                           | System requirements                                                    |
| ------------ | ------------------------------------------------------------------------------------------- | ---------------------------------------------------------------------- |
| Describes    | The problem                                                                                 | An abstract solution                                                   |
| Language     | The user's                                                                                  | The developer's                                                        |
| Organized by | Goals                                                                                       | Functions in a hierarchy                                               |
| Subject      | A type of user                                                                              | The system or a subsystem                                              |
| Defines      | What the user gets                                                                          | What the system does                                                   |
| Owned by     | Users                                                                                       | Developers                                                             |
| Example      | "The order entry clerk shall be able to complete ten customer orders in less than an hour." | "The order entry system shall provide the ship date of ordered items." |

A user is anyone involved with the system while it is working, not only the person operating it. For an order system that includes the order entry clerk, the shipping clerk, the salesperson, the department supervisor, and the customer.

## Checklist for each requirement

| Check      | Question                                      |
| ---------- | --------------------------------------------- |
| Correct    | Is it possible, doable, and legal?            |
| Complete   | Is it a complete sentence?                    |
| Clear      | Does it have exactly one reading?             |
| Consistent | Does it conflict with any other requirement?  |
| Verifiable | Can a test show whether the system meets it?  |
| Traceable  | Does it have a unique ID that can be tracked? |
| Feasible   | Can it be built within the cost and schedule? |

Also record a priority, the source, the status, and the verification method for each requirement, and keep design constraints apart from user and system requirements.

## Structuring the document

A medium-sized project has hundreds of requirements, and a flat list of them is unreadable. Group them under at most three heading levels, ordered by how users go through the system.

```text
1. Prepare Aircraft for Flight
   Fueling
   Cleaning
   Loading baggage
   Loading meals & supplies
   Loading passengers
   Pre-flight Checks
2. Operate the Flight
   Taxiing to runway
   Takeoff
   Flight operations
   Landing
   Docking
3. Maintain Aircraft
   Daily Servicing
   Major Servicing
```

## Process

- Start writing immediately. A first draft only needs to capture the intent.
- Circulate drafts early, because a document gets feedback that a conversation does not.
- Set the outline early, or let it form over a few iterations.
- Review internally throughout, and show drafts to real users so they can correct them quickly.
- Clean up in passes: run the checklist and the wording list above against every requirement.
- Move off spreadsheets once the set grows. The article's list of what to look for in a tool: traceability from user needs to system requirements, design, and tests, plus version history with the reason for each change, per-requirement attributes, and review workflows.

## Source

Modern Requirements, "How to Write Better Requirements", read on 2026-10-03:
[modernrequirements.com/blogs/how-to-write-better-requirements](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/)

Each link below opens the article at the named heading in browsers that support text fragments. In other browsers it opens the top of the article, and the heading can be found by searching the page.

| Section here                              | Heading in the article                                                                                                                                                                                                                                                                                                                                            |
| ----------------------------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Agree on the problem first                | [Why Most Requirements Fail](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Why%20Most%20Requirements%20Fail), [The Single Most Important Principle](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=The%20Single%20Most%20Important%20Principle)                                          |
| The shape of a requirement                | [What a Requirement Actually Is](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=What%20a%20Requirement%20Actually%20Is), [The Anatomy of a Good Requirement](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=The%20Anatomy%20of%20a%20Good%20Requirement)                                  |
| Writing rules                             | [8 Practical Guidelines for Writing Requirements](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=8%20Practical%20Guidelines%20for%20Writing%20Requirements)                                                                                                                                                                   |
| Wording to avoid                          | [Common Pitfalls That Sink Projects](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Common%20Pitfalls%20That%20Sink%20Projects)                                                                                                                                                                                               |
| User requirements and system requirements | [User Requirements vs. System Requirements: Know the Difference](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=User%20Requirements%20vs.%20System%20Requirements)                                                                                                                                                            |
| Checklist for each requirement            | [The 7-Point Checklist for a Good Requirement](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Checklist%20for%20a%20Good%20Requirement), [Where Modern Requirements Fits In](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Where%20Modern%20Requirements%20Fits%20In) for the attributes |
| Structuring the document                  | [Why Structure Matters as Much as Wording](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Why%20Structure%20Matters%20as%20Much%20as%20Wording)                                                                                                                                                                               |
| Process                                   | [Putting It All Together: Your Action Plan](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Putting%20It%20All%20Together), [Where Modern Requirements Fits In](https://www.modernrequirements.com/blogs/how-to-write-better-requirements/#:~:text=Where%20Modern%20Requirements%20Fits%20In) for the tooling list             |
