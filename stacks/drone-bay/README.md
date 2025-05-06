# Drone Bay Stack (Single Container: Open WebUI + Ollama)

This stack provides internal AI and LLM services for your homelab using a **single-container deployment** that bundles Open WebUI and Ollama. It is optimized for simplicity, maintainability, and GPU acceleration.

---

## Features
- **Single container:** Runs both Open WebUI and Ollama together for seamless integration.
- **GPU support:** Use the `:ollama` image with NVIDIA GPUs for fast inference (CUDA required).
- **Local RAG:** Upload documents in the WebUI for Retrieval Augmented Generation (RAG) chat.
- **Traefik integration:** Both the WebUI (port 8080) and Ollama API (port 11434) are securely exposed via Traefik with HTTPS and middleware support.
- **All optional environment variables included** for advanced tuning.

---

## Quick Start
1. Copy `.env` to `.env.local` (or edit `.env` directly) and fill in any required/desired values.
2. Review and adjust domain names in `.env` (`BRAINS_DOMAIN`, `BRAINS_API_DOMAIN`).
3. Run:
   ```sh
   docker compose up -d
   ```
4. Access Open WebUI at `https://brains.cityzen.co.za` (or your domain).
5. Access the Ollama API at `https://brains-api.cityzen.co.za` (or your domain).

---

## Environment Variables
All variables are defined in `.env`. Most are optional and have sensible defaults.

| Variable                       | Description                                            | Default/Example                   |
|--------------------------------|--------------------------------------------------------|-----------------------------------|
| DOCKERDIR                      | Root dir for persistent data                          | `/home/homelab/conf`              |
| INTERNAL_NETWORK, EXTERNAL_NETWORK | Docker network names                                | `internal`, `external`            |
| BRAINS_DOMAIN                  | Traefik domain for WebUI                              | `brains.cityzen.co.za`            |
| BRAINS_API_DOMAIN              | Traefik domain for Ollama API                         | `brains-api.cityzen.co.za`        |
| WEBUI_SECRET_KEY               | Secret for login sessions                             | `changeme`                        |
| PRELOAD_MODELS                 | Models to preload in Ollama                           | `mistral:latest`                  |
| ENABLE_RAG_WEB_SEARCH          | Enable RAG web search in chat                         | `true`                            |
| RAG_WEB_SEARCH_ENGINE          | Web search engine for RAG                             | `brave`                           |
| BRAVE_SEARCH_API_KEY           | API key for Brave search                              |                                   |
| ...                            | (See `.env` for full list of advanced options)        |                                   |

---

## Volumes
- `${DOCKERDIR}/llm/ollama-data:/root/.ollama` — Ollama model/cache data
- `${DOCKERDIR}/llm/open-webui-data:/app/backend/data` — Open WebUI persistent data

---

## Traefik Labels
- WebUI: `brains.cityzen.co.za` → port 8080
- Ollama API: `brains-api.cityzen.co.za` → port 11434
- Both routes use the `authelia@docker` middleware for security

---

## Upgrading & Maintenance
- To update the container, pull the latest image and restart the stack:
  ```sh
  docker compose pull && docker compose up -d
  ```
- All persistent data is stored in the mapped volumes.

---

## Advanced Usage
- To enable more advanced Ollama or WebUI options, set the corresponding variables in `.env`.
- For direct API access (e.g., from n8n), use the Ollama API domain/route.

---

## Legacy Configuration
- The previous multi-container setup is saved as `drone-bay-unasimilated.yml` and `.env.unasimilated` for reference or rollback.

---

For more details, see the official [Open WebUI documentation](https://docs.openwebui.com/) and [Ollama documentation](https://github.com/ollama/ollama/blob/main/docs/gpu.md).
