# Watchtower (Automated Docker Updates)

Watchtower automatically updates your running Docker containers whenever new images are available, helping keep your homelab secure and up to date.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables (including notification hooks if desired).
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `WATCHTOWER_IMAGE`: Image tag/version for Watchtower.
- `WATCHTOWER_NOTIFICATION_DISCORD_HOOK_URL`: Discord or Slack webhook URL for notifications.
- `WATCHTOWER_MSG_NAME`: Sender name for notifications.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`: Docker network name.
- `DOCKER_API_VERSION`: Docker API version to use.

## Networking
- Joins the internal Docker network.
- No ports are exposed by default.

## Security
- Runs with `no-new-privileges` for container hardening.

## Notes
- Supports rolling restarts, cleanup of old images, and flexible notification settings.
- Can be scoped or run in monitor-only/dry-run mode with additional environment variables.

---
