# Manual Sync Process for Forked Repositories

This guide describes the manual steps to sync your forked repositories with their upstream sources.

## Prerequisites
- Git installed on your local machine.
- GitHub CLI installed (optional for advanced workflows).
- SSH keys configured for GitHub authentication.

## Steps
1. Clone the forked repository:
   ```bash
   git clone <fork-repo-url>
   ```
2. Configure the upstream repository:
   ```bash
   git remote add upstream <original-repo-url>
   ```
3. Fetch changes from the upstream repository:
   ```bash
   git fetch upstream
   ```
4. Merge changes into your fork:
   ```bash
   git checkout main
   git merge upstream/main
   git push origin main
   ```

Repeat these steps for each of your forked repositories.

For more details, visit [GitHub's Official Guide](https://docs.github.com/en/pull-requests/collaborating-with-pull-requests/working-with-forks/syncing-a-fork).