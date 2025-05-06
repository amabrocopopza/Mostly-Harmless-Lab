# Duplicati (Backup Service)

Duplicati provides encrypted, incremental backups for your homelab, supporting a wide range of storage backends.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `DUPLICATI_IMAGE`: Image tag/version for Duplicati.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for persistent data and configuration.

## Volumes
- `${DOCKERDIR}/duplicati/config`: Duplicati config
- `${DOCKERDIR}/duplicati/backups`: Backup destination
- `${DOCKERDIR}/duplicati/source`: Source data to back up

## Networking
- Joins both internal and external Docker networks.
- Exposed via Traefik with secure HTTPS route and middleware.

## Security
- Runs with `no-new-privileges` for container hardening.

---
