# Holo Deck Stack

This stack provides media automation and management for your homelab, including Plex, Radarr, Sonarr, Prowlarr, Tautulli, Transmission, and Jellyseerr.

## Minimum Required Environment Variables

Most services set their API keys and passwords in the web UI after first run. Only Transmission typically requires credentials set in the `.env` file for initial use.

### Transmission
- `TRANSMISSION_PASS` – Transmission password (default: `TRANSMISSION-ChAnGeM3#`)

### Plex
- `PLEX_SERVER_IP_ADVERTISE` – Plex public IP/hostname (recommended for remote access and proper network discovery)
- `PLEX_CLAIM` – Plex claim token (required only on first run to register the server; see https://plex.tv/claim)

### General
- `PUID` – User ID for file permissions (default: `1000`)
- `PGID` – Group ID for file permissions (default: `1000`)
- `TZ` – Timezone (default: `Africa/Johannesburg`)
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK` – Docker network names
- `DOCKERDIR`, `MEDIALIBRARY` – Host paths for config and media (relative by default, override with absolute paths if desired)

> **Note:** For Radarr, Sonarr, Prowlarr, Tautulli, and Jellyseerr, set API keys/secrets in the app UI after first run. If you wish to set them via environment variables, use the provided commented examples in `.env.example`.

> **Path Recommendation:** By default, config and media folders are relative to the stack directory (`./conf`, `./media/library`). You can override these in your `.env` with absolute paths to suit your environment. The compose file will fallback to `/home/homelab/conf` and `/mnt/pool/library` if not set.

---

## Folder Structure (Best Practice)

The following structure ensures all apps work together seamlessly:

```
/mnt/pool/library/
  ├── movies/                # Movies (Radarr, Plex)
  ├── tv/                    # TV Shows (Sonarr, Plex)
  ├── downloads/
  │     ├── incomplete/      # Incomplete downloads (Transmission)
  │     └── complete/        # Finished downloads (Radarr/Sonarr import from here)
  └── music/                 # (Optional: Music for Plex, etc.)
```

- **All apps mount the same `/mnt/pool/library` structure.**
- **Transmission** uses `/downloads`, `/downloads/complete`, `/downloads/incomplete`.
- **Radarr** uses `/movies` and `/downloads/complete`.
- **Sonarr** uses `/tv` and `/downloads/complete`.
- **Plex** uses `/library` (read-only) to see all media.
- **Prowlarr** does not need media volumes, only `/config`.

---

## App-specific Setup Instructions

### Plex
- Library folders: `/library/movies` and `/library/tv` (add these as libraries in Plex UI)
- No write access required for media.

### Radarr
- Movies folder: `/movies`
- Downloads folder: `/downloads`
- Set both in Radarr UI under Settings → Media Management.

### Sonarr
- TV folder: `/tv`
- Downloads folder: `/downloads`
- Set both in Sonarr UI under Settings → Media Management.

### Transmission
- Download folder: `/downloads` (set in Transmission UI)
- Incomplete folder: `/downloads/incomplete`
- Complete folder: `/downloads/complete`

### Prowlarr
- No media folders needed. Configure indexers and link to Radarr/Sonarr via app UI.

---

## Pre-configured App Setups

You can pre-populate config folders with app config files (from a template or previous backup) by placing them in the respective `conf` subfolders before the first container launch:

- `conf/plex/` for Plex
- `conf/radarr/` for Radarr
- `conf/sonarr/` for Sonarr
- `conf/prowlarr/` for Prowlarr
- `conf/transmission/` for Transmission

> **Note:** Most LinuxServer containers will use the config you provide if it exists at first launch. You can export settings from a running instance and copy them in, or use a prepared template. This allows you to pre-configure indexers, download clients, and other settings.

---

## Quick Start
1. Copy `.env.example` to `.env` and fill in the required values above.
2. Ensure your host folders match the structure above (create if needed).
3. (Optional) Place pre-configured app configs in the appropriate `conf/` folders.
4. Run `docker compose up -d` in this directory.
5. Access Plex and all other services via your configured Traefik domains or local network.

---

For more details, see the comments in `.env.example` and `holo-deck.yml`.
