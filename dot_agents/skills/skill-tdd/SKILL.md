---
name: skill-tdd
description: ALWAYS load before creating, editing or testing any skill. Contains the required test procedure.
---

1. Write a short, neutral task prompt that triggers the problem. Don't hint at the fix.
2. Run it in a fresh subagent without the skill. Confirm it fails and note exactly how.
3. Write or edit the skill to target that failure. Keep it general, not tied to the test case.
4. Re-run the identical prompt in a fresh subagent with the skill available.
5. If it still fails or finds a new loophole, revise and repeat from step 4.
6. Report before/after behaviour.
