# Portainer (Container Management UI)

Portainer provides a modern web UI for managing Docker containers, images, networks, and more.

## Usage
1. Copy `.env.example` to `.env` and fill in the required variables.
2. Deploy with Docker Compose:
   ```sh
   docker compose up -d
   ```
3. Access Portainer at: https://dock.cityzen.co.za

## Environment Variables
- `DOCKERDIR`: Host path for persistent data and configuration.
- `DOCKER_API_VERSION`: Docker API version to use.

## Volumes
- `/var/run/docker.sock`: Docker socket (required for management)
- `${DOCKERDIR}/portainer-ee`: Persistent Portainer data

## Networking
- Joins the external `homelab` Docker network.
- Exposes ports 9000 (web UI) and 8000 (agent).
- Exposed via Traefik with secure HTTPS route and middleware.

## Security
- Runs with `no-new-privileges` for container hardening (inherited from stack best practices).
- Only the Docker socket is exposed, and only as required for Portainer functionality.

---
