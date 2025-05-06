---


## 📁 Wazuh Config Folder Setup
- The Wazuh stack requires a configuration folder with SSL certs and service configs.
- **You must copy the `conf/wazuh/config` folder from the Wazuh Docker repository (or your backup) to the project base directory:**
  - Example: `/home/homelab/conf/wazuh/config/`
  - This folder contains subfolders like `wazuh_indexer_ssl_certs`, `wazuh_indexer`, `wazuh_dashboard`, and files like `certs.yml`.
- **Why?**
  - These files are required for SSL, user management, and service startup.
  - If you change the project path or `DOCKERDIR`, update all volume mappings in your compose files accordingly.

---

## 🔑 Generating Wazuh SSL Certificates
- Wazuh services require SSL certificates for secure communication.
- **To generate new certs:**
  1. Edit (or review) `config/generate-indexer-certs.yml` to ensure the volume paths match your project layout and `DOCKERDIR`.
  2. Run the certificate generator with:
     ```sh
     docker compose -f config/generate-indexer-certs.yml up
     ```
  3. The certs will be created in `conf/wazuh/config/wazuh_indexer_ssl_certs/`.
- **When do you need to run this?**
  - On first setup
  - If you lose or need to rotate SSL certs
  - After restoring from backup if certs are missing
- **Tip:**
  - If you move or rename your project, update all paths in `generate-indexer-certs.yml` and your main compose files to match.
  - Always keep your SSL keys private and never commit them to version control.

---

