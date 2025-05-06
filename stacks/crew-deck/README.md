# 🌌 crew-deck  
*A perfectly normal dashboard and snippet stack — for an unusually unpredictable galaxy.*

> **“In the beginning, the homelab was created. This has made a lot of people very angry and has been widely regarded as a bad move.”**  
> — *The Guide*

---

## 🪐 Introduction

Welcome to **crew-deck**, your ship’s unofficial lounge, startpage, and data-sticky-board. It is — much like the towel — not strictly necessary, but life without it tends to unravel quite quickly.

It contains:

- 🧭 `flame` — your digital bridge crew’s startpage
- 🧠 `snibox` — a hyper-intelligent notepad for fragments of shell incantations, NGINX spells, and the occasional haiku written in YAML

If you’re reading this README, you are either:

1. Attempting to understand what you deployed,
2. Wondering why Flame isn’t loading,
3. Searching for a snippet you absolutely did write down “somewhere.”

This README cannot help you with #2. It was never trained in engineering.

---

## 🚀 Services in this Deck

### 🔥 flame  
**"The Startpage at the End of the Universe"**

Flame serves as the central console — not because it's the most powerful, but because it looks impressive and knows where everything else is.

- Serves HTTPS via Traefik, complete with enough middleware to make a Vogon feel secure
- Password protected (hopefully with something better than `admin123`)
- Configurable via `.env`, assuming you remember where that is
- Hosted at [`cityzen.co.za`](https://cityzen.co.za) and [`www.cityzen.co.za`](https://www.cityzen.co.za), depending on how much you trust subdomains

> “It won’t tell you what went wrong. But it will point you to the right direction to start panicking.”

---

### ✂️ snibox  
**"Where snippets go to not be forgotten (eventually)"**

Snibox is a code snippet manager, which sounds simple until you remember how many ways you’ve saved `docker run` flags over the years.

- Stores snippets, tags them, and keeps your command-line sorcery in one neat place
- Uses SQLite — the Marvin of databases: simple, reliable, a little bit depressed
- Read-only by default, which is good for sanity
- Exposed at [`snip.cityzen.co.za`](https://snip.cityzen.co.za) with all the TLS, CSP, and no-powered-by headers you can shake a towel at

> “It knows things. But it won’t gloat. Much.”

---

## 📡 Networking

Your services travel through space on the following networks:

```yaml

