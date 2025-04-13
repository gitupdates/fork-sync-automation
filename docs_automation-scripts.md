# Automation Scripts

This document provides details about the scripts used for automating the fork sync process.

## Scripts
### `scripts/sync-forks.sh`
A shell script to sync multiple repositories with their respective upstream sources.

### Usage
1. Make the script executable:
   ```bash
   chmod +x scripts/sync-forks.sh
   ```

2. Run the script:
   ```bash
   ./scripts/sync-forks.sh
   ```

3. Example Configuration:
   - Update the script to include your repositories and upstream URLs.
   - Add error handling for failed merges.

## Future Improvements
- Dynamic repository detection using GitHub API.
- Notifications for sync status.