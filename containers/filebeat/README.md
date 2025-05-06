# Filebeat (Log Forwarder)

Filebeat ships logs from your containers and host to Elasticsearch or other outputs for analysis and alerting.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `FILEBEAT_IMAGE`: Image tag/version for Filebeat.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for Filebeat config.

## Volumes
- Config and persistent data are mounted from `${DOCKERDIR}/monitoring/filebeat/`.

## Networking
- Joins both internal and external Docker networks.
- Exposes port 5066 for Prometheus metrics and via Traefik.

## Security
- Runs with `no-new-privileges` for container hardening.

---
