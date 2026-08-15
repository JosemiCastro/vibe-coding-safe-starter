# When NOT to deploy

Most beginner problems do not come from writing bad code.
They come from deploying too early.

## Do NOT deploy if
- you do not understand what changed
- you do not know which files AI touched
- you have no backup and real data is involved
- you do not know how to go back
- you did not test the main flow
- the change mixes too many things at once
- you touched auth, payments, or the database without reviewing impact

## Danger signals

### 1. The prompt was too broad
If you asked for something like:
- “improve the app”
- “refactor the system”
- “make this more professional”

then do not deploy without a much deeper review.

### 2. Too many files changed
If you wanted to touch one form and suddenly 15 files changed, that is a bad sign.

### 3. You cannot explain rollback
If you cannot answer “how do I go back in 5 minutes?”, do not deploy.

### 4. You never saw logs or a real error
If the fix was done by guesswork, do not deploy.

### 5. Deploy is how you plan to discover whether it works
That is not validation. That is gambling.

## Extra caution
If the change affects:
- login
- users
- permissions
- payments
- database
- automations

raise your caution level.

## What to do instead
- ask AI for a summary of affected files
- ask for risks
- ask for rollback
- test the exact flow
- commit the known-good state
- split the change into smaller parts
- ask AI to remove unrelated refactors

## Micro-checklist
Before deploying, you should be able to say:
- what changed
- how it is tested
- how it is reverted
- whether real data is involved
- what you will check right after release

## Final rule
Your problem is almost never “I deployed too late.”
Your problem is “I deployed something I did not understand.”
