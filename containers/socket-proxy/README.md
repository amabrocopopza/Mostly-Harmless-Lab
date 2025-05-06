# Life Support Stack

This stack provides a secure Docker Socket Proxy for your homelab, enabling safe and controlled access to the Docker API for monitoring, automation, and management tools.

## What is Included?
- **docker-socket-proxy**: A lightweight, secure proxy that exposes only selected Docker API endpoints to containers that need them.

## Usage
1. **Configure Environment**
   - Copy `.env.example` to `.env` and adjust values if needed:
     ```sh
     cp .env.example .env
     ```
   - Set `INTERNAL_NETWORK` and `EXTERNAL_NETWORK` as needed for your environment.

2. **Start the Stack**
   - Use Docker Compose:
     ```sh
     docker compose -f life-support.yml up -d
     ```

3. **Networking**
   - The stack defines two networks:
     - `internal`: For internal communication between services.
     - `external`: For communication with other stacks or external services (optional).

4. **Security Notes**
   - The Docker socket is mounted read-only and only selected API features are enabled for best security.
   - Review and adjust the `environment` section in `life-support.yml` to further restrict or expand API access as needed.
   - Do **not** expose this proxy to untrusted networks.

## References
- [tecnativa/docker-socket-proxy (GitHub)](https://github.com/tecnativa/docker-socket-proxy)
- [Docker Compose Documentation](https://docs.docker.com/compose/)

---

**Maintainer:** Your Homelab
