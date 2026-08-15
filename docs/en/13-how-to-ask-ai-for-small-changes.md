# How to ask AI for small changes

If you are starting out, this skill is more valuable than explaining technical theory.

## Typical mistake
Asking for changes that are too big:
- “improve the whole app”
- “make it more professional”
- “fix the backend”

That usually creates:
- too many changed files
- a mix of fix and refactor
- changes that are hard to review
- more deployment risk

## What to ask for instead
Ask for small, reviewable units.

Good examples:
- “add validation to this form”
- “fix this 400 error in this endpoint”
- “touch only this component and its endpoint”
- “do not change auth or the database”

## Recommended prompt structure
Always include:
- exact goal
- stack
- affected file or area
- what it must NOT touch
- how to validate
- how to roll back

## Minimum template
```text
Project [stack].
I want to change [specific area].
Touch only [file/module/flow].
Do not change [auth/database/deploy/other areas].
Tell me affected files, risks, validation, and rollback.
```

## How to reduce a request that is still too big
If the change is broad, split it like this:
1. define the exact error or improvement
2. choose one area only
3. forbid unrelated refactors
4. validate that part
5. move to the next part later

## If AI returns too much
Do not paste it blindly.
Reply with:
- “reduce the scope”
- “split this into steps”
- “do only part A”
- “do not refactor unrelated code”
- “return only the minimum files needed”

## Signs the change is still too big
- you cannot explain it in 3-5 clear lines
- it touches frontend, backend, and DB at the same time
- you need deploy to discover whether it works
- you do not know what part to review first

## Practical rule
If you cannot describe the change in 3-5 clear lines, it is probably still too big.

## Final rule
Small changes do not make you slower.
They keep you from breaking more than you can review.
