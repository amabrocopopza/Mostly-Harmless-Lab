# 📦 cargo-hold  
*"The digital equivalent of that drawer everyone has — but with more encryption and fewer expired batteries."*

Welcome aboard the **cargo-hold**, a secure containment unit floating somewhere in the outer quadrants of your homelab nebula.  
Its primary mission: to safely store, manage, and occasionally reveal data to other needy star systems — assuming they have the proper clearance codes and don’t ask too many questions.

This stack is where information goes to be stored, secured, and possibly interrogated.  
If the Homelab were a spaceship (which, frankly, it is), the **cargo-hold** would be that oddly humming bay below decks filled with blinking lights, mysterious crates, and an AI whispering,  
*"I wouldn't touch that if I were you."*

---

## 🧰 Systems Manifest

### 🗃️ MinIO — *Galactic Object Storage*  
A hyperspeed-compatible S3-compatible storage engine for anything you want to stash, back up, or lose track of in deeply nested buckets.

- [https://bucket.cityzen.co.za](https://bucket.cityzen.co.za)
- Wildcard subdomains per bucket (e.g., `some-bucket.bucket.cityzen.co.za`)
- Exposes metrics to Prometheus when it’s feeling introspective
- Secured via Authelia to prevent rogue Vogons from uploading poetry

> *"A safe place for your files — unless they're self-aware."*

---

### 🕵️ Infisical — *Intergalactic Secrets Vault*  
Manages secrets with the same paranoia you do, only more organized.

- [https://secrets.cityzen.co.za](https://secrets.cityzen.co.za)
- Protects keys, credentials, and configs for the entire fleet
- Integrates with Redis, Postgres, and SMTP (for whispering alerts)
- Emits metrics so you can graph your paranoia

> *“Because hiding passwords in your `.env` file is so pre-wormhole era.”*

---

### 🗂 FileGator — *Read-Only File Portal for Curious Travelers*  
Your personal digital librarian: doesn’t talk much, but will open the right drawer when asked nicely (read-only).

- UI for browsing shared folders
- Integrated with Traefik
- Monitored, health-checked, and probably judging your directory names

> *“Access granted. Judgement withheld (for now).”*

---

## 📖 What It Does

- **MinIO:** Buckets of files stored securely and served with S3 swagger  
- **Infisical:** API keys, credentials, and shared secrets under lock and crypto-key  
- **FileGator:** A basic browser for that one shared folder everyone keeps emailing you about  

Think of this stack as your homelab's **vault + warehouse + broom closet**.

---

## 🛠 Recommended Usage

| Service     | Role                                           | URL                                          |
|-------------|------------------------------------------------|----------------------------------------------|
| MinIO       | S3-compatible object storage                   | [https://bucket.cityzen.co.za](https://bucket.cityzen.co.za) |
| Infisical   | Secrets management                             | [https://secrets.cityzen.co.za](https://secrets.cityzen.co.za) |
| FileGator   | Read-only file manager                         | *(Configure your domain)*                    |

---

## 🪐 Networking & Neighbors

- Services float across internal and external Docker networks  
- Frontline access routed through Traefik, guarded by Authelia  
- All services report suspicious activity to Prometheus (who quietly judges them)

---

## ⚙️ Configuration Notes

- Ensure `DOCKERDATA` and `DOCKERDIR` are defined in your `.env`
- MinIO supports **per-bucket subdomain routing** (wildcard DNS needed)
- DNS records managed via Cloudflare or local overrides

> *“Because no one wants their buckets exposed to the void of space (or the open internet).”*

---

## ☢️ Warning From the Galactic Safety Board

- Losing your `.env` file may result in timeline bifurcation or, worse, no backups.
- Misconfigured permissions could allow Martian data scientists access to your vacation photos.
- Secrets stored in plaintext will be publicly shamed.

---

## 🔭 Future Improvements

> "Just because it's absurd doesn't mean it can't be expanded."

- 🪙 **Interstellar Data Tollbooth** — Monetize API access to MinIO (credits, crypto, cat memes)
- 🧬 **Autonomic Secret Rehydration** — Secrets that decrypt themselves on solar alignment
- 📜 **Bucket Prophecy Engine** — AI predicts which bucket will break everything (for fun)
- 🦠 **FileGator Quarantine Zone** — Detect and isolate suspicious `.tar.gz` files labeled “final-v2-revised-latest.zip”
- 🛸 **Secrets-as-a-Service™** — Let other homelabbers rent your vault (what could go wrong?)
- 🌌 **Teleport API Gateway** — Directly send files to another stack’s cargo-hold via wormhole

---

## 🧯 Console Shortcuts

Drop these into your `~/.bashrc` or `.zshrc` for easier interstellar navigation:

```bash
alias cargo-console='docker compose exec minio /bin/sh'
alias stash-secret='curl -X POST https://secrets.cityzen.co.za/api/v1/secrets ...'
alias open-vault='xdg-open https://secrets.cityzen.co.za'
alias browse-buckets='xdg-open https://bucket.cityzen.co.za'
