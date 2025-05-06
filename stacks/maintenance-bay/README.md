# Maintenance Bay Stack

This stack provides DNS-level ad-blocking, automated encrypted backups, and automated Docker maintenance for your homelab. Each service is configured for security, maintainability, and best practices.

## Services

### 1. AdGuard Home
- **Purpose:** DNS-level ad-blocking and privacy protection.
- **Volumes:**
  - `/adguard-home/work` (runtime data)
  - `/adguard-home/conf` (configuration)
- **Web UI:** Accessible via Traefik at `https://adman.cityzen.co.za`
- **Notes:** All advanced configuration is managed via the AdGuard Home web UI.

### 2. Duplicati
- **Purpose:** Secure, encrypted backups of your data.
- **Volumes:**
  - `/duplicati/config` (Duplicati config)
  - `/duplicati/backups` (backup storage)
  - `/homelab` (reference to homelab config)
  - `/labWorkspace` (workspace reference)
- **Mods:** ThemePark mod enabled for UI theming.
- **Web UI:** Accessible via Traefik at `https://duplicati.cityzen.co.za`

### 3. Watchtower
- **Purpose:** Automated Docker container updates and cleanup.
- **Features:**
  - Rolling restarts
  - Notification support (Slack/Discord)
  - Customizable schedule
  - Supports scoped operation and private registry authentication (see `.env.example` for advanced options)

## Networks
- **internal:** Isolated Docker network for service communication
- **external:** Exposes select services to Traefik and LAN

## Usage
1. Copy `.env.example` to `.env` and fill in the required secrets and variables.
2. Deploy with `docker compose up -d`.
3. Access services via their respective URLs.

## Security Notes
- All containers run with `no-new-privileges` for enhanced security.
- Sensitive keys and secrets should always be stored in your `.env` file, not in the compose file.

---
For advanced Watchtower options, see the commented environment variables in the compose file and consult the [Watchtower documentation](https://containrrr.dev/watchtower/).
