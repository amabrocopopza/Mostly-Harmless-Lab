# Wazuh Suite (Indexer + Dashboard)

This container group provides both the Wazuh Indexer and Wazuh Dashboard for security analytics and monitoring.

**Note:** You must provide an external PostgreSQL (or compatible) database for production deployments. Set the DB connection variables in your `.env` file as needed.

## Services
- **wazuh-indexer:** Stores and indexes security events.
- **wazuh-dashboard:** Web UI for security analytics, visualization, and management.

## Usage
1. Copy `.env.example` to `.env` and fill in all required secrets and database connection details.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `WAZUH_PASSWORD`: Password for the Indexer service.
- `WAZUH_DASHBOARD_PASSWORD`: Password for the Dashboard service.
- **Database:** Add `POSTGRES_HOST`, `POSTGRES_USER`, `POSTGRES_PASSWORD`, etc., as needed for your environment.

## Volumes
- Persistent data for indexer and dashboard is stored in named Docker volumes.

---
**External DB required for production.**
