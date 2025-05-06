# Captains Quarters Stack

This stack provides home automation and IoT services for your homelab, including Home Assistant, ESPHome, Mosquitto (MQTT), Frigate (NVR), and Node-RED.

## Minimum Required Environment Variables

Set these variables for a functional and secure deployment. Most other variables have defaults for local use.

### Frigate (NVR)
- `FRIGATE_RTSP_PASSWORD` – RTSP password for camera streams (default: `CH@NGE_ME`)

### Mosquitto (MQTT)
- `MQTT_USER` – MQTT username (optional, but recommended)
- `MQTT_PASSWORD` – MQTT password (default: `MOSQUITTO-ChAnGeM3#` if set)

### ESPHome
- `USERNAME` – ESPHome dashboard username (optional)
- `PASSWORD` – ESPHome dashboard password (default: `Ifeel2StupidForNotChangingThis` if set)

### Node-RED
- `NODE_RED_CREDENTIAL_SECRET` – Secret for encrypting credentials (default: `NODERED-ChAnGeM3#` if set)

### Home Assistant
- No required variables for basic operation (uses defaults), but you may set a custom image or supervisor variables as needed.

### Paths
- `DOCKERDIR`, `MEDIALIBRARY`, `CAMERALIBRARY`, `LABWORKSPACE` – By default, these are relative to the stack directory (e.g., `./conf`, `./media/library`). You can override with absolute paths in your `.env`.

## Quick Start
1. Copy `.env.example` to `.env` and fill in the required values above.
2. Run `docker compose up -d` in this directory.
3. Access Home Assistant, ESPHome, Mosquitto, Frigate, and Node-RED via your configured network or Traefik domains.

---

For more details, see the comments in `.env.example` and `captains-quarters.yml`.
