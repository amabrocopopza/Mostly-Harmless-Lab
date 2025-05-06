# cityzen-ddns

This container runs a Cloudflare Dynamic DNS updater using the [oznu/cloudflare-ddns](https://hub.docker.com/r/oznu/cloudflare-ddns) image.

## Purpose
- Automatically updates Cloudflare DNS records to match your current public IP address.
- Useful for home labs or dynamic IP environments where your WAN address can change.

## Usage
1. Copy `.env.example` to `.env` and fill in your Cloudflare API token and domain.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```

## Environment Variables
- `CLOUDFLARE_DNS_API_TOKEN`: Cloudflare API token with DNS edit permissions.
- `DOMAINNAME0`: The DNS zone/record to update (e.g., `example.com`).
- `PUID`/`PGID`: Set file permissions for the container (optional).
- `TZ`: Timezone (optional).

## Security
- Runs with `no-new-privileges` for extra hardening.
- No ports are exposed; all communication is outbound to Cloudflare.

## Networks
- Uses the `internal` Docker network.

---
Maintained as part of the Homelab Shield Array stack.
