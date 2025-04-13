# Manual Sync Process

This document explains the manual process for syncing a forked repository with its upstream source.

## Steps
1. **Add the Upstream Remote**:
   ```bash
   git remote add upstream https://github.com/upstream-owner/upstream-repo.git
   ```

2. **Fetch Changes from Upstream**:
   ```bash
   git fetch upstream
   ```

3. **Merge Changes into Your Local Branch**:
   ```bash
   git checkout main
   git merge upstream/main
   ```

4. **Push Changes to Your Fork**:
   ```bash
   git push origin main
   ```

## Note
Follow these steps if conflicts arise:
- Resolve conflicts manually.
- Commit the changes.