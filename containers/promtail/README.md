# Promtail (Log Shipper)

Promtail collects logs from containers and ships them to Loki for indexing and analytics.

## Usage
1. Copy `.env.example` to `.env` and fill in required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `PROMTAIL_IMAGE`: Image tag/version for Promtail.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`/`EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for Promtail config.

## Volumes
- Mounts Promtail config from `${DOCKERDIR}/monitoring/promtail/config.yaml`.

## Networking
- Joins both internal and external Docker networks.
- Exposes port 9080 internally for Prometheus scraping and via Traefik.

## Security
- Runs with `no-new-privileges` for container hardening.

---
