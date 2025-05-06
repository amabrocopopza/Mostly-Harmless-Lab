# 🛡️ Shield Array Stack

Secure reverse proxy, authentication, and dynamic DNS for your Homelab, with a strong focus on security and best practices.

---

## 🚀 Overview
The Shield Array stack provides:
- **[Traefik](https://github.com/traefik/traefik)**: Modern reverse proxy and load balancer
- **[Authelia](https://github.com/authelia/authelia)**: Single sign-on & two-factor authentication gateway
- **[Cloudflare DDNS](https://github.com/oznu/docker-cloudflare-ddns)**: Automatic DNS updates for dynamic IPs
- **Docker Socket Proxy**: Securely exposes only the necessary Docker API endpoints to Traefik

---

## 🔑 Required API Keys & Setup Notes

- **Cloudflare API Token**: You’ll need a Cloudflare API token for DNS and certificate automation. 
  - **Permissions needed:**
    - `Zone:DNS:Edit` (for DDNS and DNS-01 challenge)
    - `Zone:Zone:Read` (for listing zones)
    - `Zone:Cache Purge` (optional, but handy)
    - `Account:Read` (sometimes required for ACME)
  - 🔒 **Tip:** Use the [Cloudflare API Token wizard](https://dash.cloudflare.com/profile/api-tokens) and only grant the minimum permissions needed.
  - 💡 **Use the Cloudflare staging resolver (acme-staging) when first setting up certificates to avoid hitting production rate limits!**
- **Duo API Key:**
  - For push notification 2FA, generate a Duo API key and plug it into your `.env` file. See [Duo docs](https://duo.com/docs/administration-keys) for details.

---

## 🏷️ Label-Only Routing Philosophy

I’ve chosen to go the **label-only** route for Traefik configuration—everything is managed via Docker labels. It’s the easiest to maintain and keeps things DRY. 

- 🧩 **Middlewares**: Still tuning the middleware for individual services. For now, the `even-less-secure` middleware is sufficient for most cases.
- ⚠️ **Note:** The `authelia@docker` middleware is *not* attached by default! You’ll need to manually attach it to the routers/services that require SSO protection.

---

## 🔮 Future Plans & Considerations

- **Authentik vs Authelia:**
  - I’m considering switching to [Authentik](https://goauthentik.io/) in the future, but for now, Authelia is lighter and does everything I need. If my requirements change, the transition shouldn’t be difficult.
- **Cloudflared Tunnel:**
  - Planning to add [cloudflared](https://developers.cloudflare.com/cloudflare-one/connections/connect-apps/) for secure tunnels to Cloudflare as a future enhancement.
- **Infisical for Env Management:**
  - I plan to integrate [Infisical](https://infisical.com/) for environment variable management at a later stage.

---

## 📦 Stack Contents
- **Compose file**: `shield-array.yml`
- **Volumes**: Persistent storage for Traefik and Authelia configs
- **Networks**: `internal` (private stack communication), `external` (public/Traefik-exposed services)

---

## 🏗️ Network Architecture
- **`internal` network**: Used for private communication between stack services (e.g., Traefik, socket-proxy, cityzen-ddns).
- **`external` network**: Used to expose services to the outside world via Traefik (e.g., Authelia, Traefik routers).
- **Best practice:** Attach Traefik to both networks. Use `external` for services that need to be accessible from outside, and `internal` for those that should remain private.
- **Docker provider network setting:**
  - You currently use `--providers.docker.network=homelab`. For this stack, set this to `external` to ensure Traefik uses the correct network to route public traffic to containers.
  - Only use `internal` if you want to restrict access to private-only services.

---

## 🔒 Docker Socket Proxy
- **Why use a proxy?**
  - Instead of mounting the Docker socket directly (which is risky), a socket proxy (such as [tecnativa/docker-socket-proxy](https://github.com/tecnativa/docker-socket-proxy)) exposes only selected Docker API endpoints to Traefik.
  - This minimizes the attack surface and follows the principle of least privilege.
- **How it works:**
  - Traefik connects to the proxy at `tcp://socket-proxy:2375` (see `--providers.docker.endpoint`).
  - The proxy container should be on the `internal` network and have the Docker socket mounted read-only.
  - Only enable the API endpoints needed by Traefik (typically `events`, `services`, `tasks`, `containers`, `networks`, `info`).
- **Reference:** See [Life Support Stack](../life-support/README.md) for a sample socket-proxy setup and security notes.

---

## ⚠️ Security & Passwords
- **All secrets, tokens, and passwords must be changed before production!**
- Backend passwords: Use `<SERVICENAME>-ChAnGeM3#` (e.g., `AUTHELIA-ChAnGeM3#`)
- Frontend/dashboard passwords: Use `Ifeel2StupidForNotChangingThis` as a placeholder
- API keys: Always use your real tokens for Cloudflare, SendGrid, etc.
- **Never commit real secrets to version control.**

---

## 🛠 Quick Start
1. **Copy and configure environment variables:**
   (Once `.env.example` is created)
   ```sh
   cp .env.example .env
   # Edit .env and fill in/change all required values
   ```
2. **Start the stack:**
   ```sh
   docker compose -f shield-array.yml up -d
   ```
3. **Access services:**
   - Traefik Dashboard: https://gatekeeper.cityzen.co.za (protected by Authelia)
   - Authelia Portal: https://auth.cityzen.co.za
   - DDNS: Managed automatically

---

## 📑 Environment Variables
- All required and optional variables will be documented in `.env.example`.
- **Required** variables must be set for the stack to function.
- **Optional** variables have defaults and can be overridden as needed.
- Sensitive variables are marked and must be changed for security.

---

## 🛡️ Seccomp Profiles
- This stack uses custom seccomp profiles for enhanced container security.
- Seccomp JSON files are located in `conf/` and `conf/seccomp/`.
- These profiles restrict the syscalls available to Traefik, Authelia, and related services, following the principle of least privilege.
- Example profiles:
  - `conf/traefik-seccomp.json` for Traefik
  - `conf/authelia-seccomp.json` for Authelia
- Each profile allows only the syscalls required for the service to function. If you encounter issues after upgrades, review and update these profiles as needed.
- For more details, see the comments in the seccomp JSON files.

## 📚 Documentation & Best Practices
- Use read-only mounts for config and secrets where possible.
- Review and update image tags regularly for security.
- Protect the dashboard and sensitive services with authentication middleware (Authelia).
- Monitor access logs and Prometheus metrics for auditing and troubleshooting.

---

## 🧩 Volumes & Data
- Configurations for Traefik and Authelia are persisted using host mounts (see `shield-array.yml`).
- **Example:**
  - `${DOCKERDIR}/traefik/rules` for Traefik rules
  - `${DOCKERDIR}/traefik/acme.json` for SSL certs
  - `${DOCKERDIR}/authelia/authelia` for Authelia config
- **Tip:** Only back up config directories, not log data.

---

## 🛡️ Security Reminders
- Change all secrets and passwords before production use.
- Restrict access to your dashboards and APIs.
- Use strong, unique passwords for all services.
- Regularly update your stack and dependencies.

---

## 🤝 Contributing
Help me improve this! Bug reports and suggestions are welcome—please follow the project standards and open an issue or pull request.

---

## 📝 License
This stack is provided under the MIT License. See LICENSE for details.
