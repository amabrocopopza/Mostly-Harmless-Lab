# Uptime Kuma (Status Monitoring)

Uptime Kuma provides a beautiful and self-hosted status page for monitoring service uptime and response times.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `UPTIMEKUMA_IMAGE`: Image tag/version for Uptime Kuma.
- `UPTIMEKUMA_PUID`/`UPTIMEKUMA_PGID`: File permissions for container volumes.
- `UPTIMEKUMA_TZ`: Timezone.
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for persistent data.

## Volumes
- Persistent data is stored in `${DOCKERDIR}/monitoring/uptimekuma`.

## Networking
- Joins both internal and external Docker networks.
- Exposed via Traefik with secure HTTPS routes and middleware.

## Security
- Runs with `no-new-privileges` for container hardening.

---
