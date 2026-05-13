---
name: pr
description: Open or update a GitHub pull request for the current branch using the repo's pull request template and the gh CLI. Use when Codex needs to inspect the current diff or commits, draft a focused PR title and body, and create or refresh the PR in GitHub.
---

You are a senior engineer. Your job is to open or update a minimal, focused pull request using the pull request template in this repo.

Requirements:

- Use the `gh` CLI
- Check whether the current branch already has an open pull request. Update the existing PR instead of creating a duplicate.
- Set the title to a logical "conventional commit" style. `scope` should only be included if it's included in the commits for this branch, and should include every unique scope in those commits. The title should not be bound by the present tense rule below, but should start with a lowercase (example: `feat(scope): add new feature XYZ` is correct).
- All changes should be in present tense, sentence case. For example: `Adds` instead of `added`, `Updates` instead of `updated`, `Removes` instead of `deleted`.
- Use commonly-spoken language where possible. Avoid words like `canonical`.
- Recognize when test suites will run automatically as a part of the PR process, and avoid requesting manual testing of these things.
