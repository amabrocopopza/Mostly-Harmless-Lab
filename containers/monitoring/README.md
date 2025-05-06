# Monitoring Suite (Loki, Promtail, Grafana, Prometheus)

This container group provides a full-featured monitoring and log analytics stack for your homelab.

## Services
- **Loki:** Log aggregation and indexing.
- **Promtail:** Log shipper, forwards logs to Loki.
- **Grafana:** Visualization and dashboards for logs and metrics.
- **Prometheus:** Metrics collection and alerting.

## Usage
1. Copy `.env.example` to `.env` and fill in all required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `LOKI_IMAGE`, `PROMTAIL_IMAGE`, `GRAFANA_IMAGE`, `PROMETHEUS_IMAGE`: Image tags/versions for each service.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for configs and data.

## Volumes
- Loki and Promtail mount their configs from `${DOCKERDIR}/monitoring/`.
- Grafana uses `${DOCKERDIR}/monitoring/grafana` for persistent data.
- Prometheus uses `${DOCKERDIR}/monitoring/prometheus/prometheus.yml` for config and a named volume for data.

## Networking
- All services join both `internal` and `external` Docker networks.
- Exposed via Traefik with secure HTTPS routes and middleware.

## Security
- All services run with `no-new-privileges` for container hardening.

---
