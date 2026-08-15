# How to roll back

Rollback is not just a technical-sounding word.
Rollback is what keeps a 10-minute mistake from ruining your whole afternoon.

## Before changing anything
You should have at least one of these:
- a clear previous commit
- a previous deployable image or release
- a recent backup
- an exported previous workflow or config

## Simple rollback options

### Code
- return to the previous commit
- redeploy the previous version
- recover the last known-good release

### Database
- restore backup
- apply migration rollback if it exists
- stop new changes while recovering integrity

### n8n or automations
- disable the trigger
- restore the previous export
- revert to the previous workflow
- confirm nothing was left running halfway

## What you should write before deploy
- what change is going out
- what version was good before
- how to go back
- how long rollback takes
- what you will test after rollback

## Warning sign
If rollback depends on inventing commands while everything is already broken, you do not have rollback.

## Minimum template
Before deploying, write something like:

```text
If this fails, I go back to commit abc123 or to the previous image.
Then I test login, home, and the main user flow.
```

## What to test after rollback
- the app opens
- login works if it exists
- the main flow is not broken
- no process was left half-running
- logs do not show new serious errors

## Typical mistake
Thinking rollback means “I’ll fix it quickly if it fails.”
That is not rollback. That is hope.

## Final rule
Do not deploy anything you cannot undo more clearly than you created it.
