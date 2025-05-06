# Loki (Log Aggregator)

Loki collects and indexes logs from across your infrastructure, providing a central place for log analytics and troubleshooting.

## Usage
1. Copy `.env.example` to `.env` and fill in required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `LOKI_IMAGE`: Image tag/version for Loki.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`/`EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for Loki config.

## Volumes
- Mounts Loki config from `${DOCKERDIR}/monitoring/loki/local-config.yaml`.

## Networking
- Joins both internal and external Docker networks.
- Exposes port 3100 internally for Prometheus scraping and via Traefik.

## Security
- Runs with `no-new-privileges` for container hardening.

---
