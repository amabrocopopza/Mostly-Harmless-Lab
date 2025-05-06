# AdGuard Home (DNS/Ad-block)

AdGuard Home provides network-wide ad blocking and DNS filtering for your homelab or LAN.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `ADGUARD_IMAGE`: Image tag/version for AdGuard Home.
- `PUID`/`PGID`: File permissions for container volumes.
- `TZ`: Timezone.
- `INTERNAL_NETWORK`, `EXTERNAL_NETWORK`: Docker network names.
- `DOCKERDIR`: Host path for persistent data and configuration.

## Volumes
- `${DOCKERDIR}/adguard-home/work`: Runtime data
- `${DOCKERDIR}/adguard-home/conf`: Configuration

## Networking
- Joins both internal and external Docker networks.
- Exposes DNS ports (53/tcp, 53/udp).
- Exposed via Traefik with secure HTTPS route and middleware.

## Security
- Runs with `no-new-privileges` for container hardening.

---
