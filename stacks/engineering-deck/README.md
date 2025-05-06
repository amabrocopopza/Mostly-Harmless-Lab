🛠️ Engineering Deck Stack
“Time is an illusion. Code doubly so.” – Ford Prefect, probably

This stack powers up your homelab’s software engineering and API tinkering ambitions with an array of developer tools that would make Deep Thought mildly impressed. Featuring a browser-based VS Code, the sleek Hoppscotch suite for API experiments, and Woodpecker CI for pushing buttons automatically.

🧪 What's on Deck?
🧠 CodeServer – Your very own cloud IDE. Write code anywhere. Like the beach. Or Magrathea.

🚀 Hoppscotch Suite – Full-stack API laboratory with admin, backend, and frontend. Tinker responsibly.

🦜 ProxyScotch – HTTP proxy for your API experiments. The Babel fish of your dev pipeline.

🛠️ Woodpecker CI – A minimalist CI/CD engine. Automate all the things.

🤖 Woodpecker Agent – Executes your build pipelines without existential crises.

🪐 Required Variables for Interstellar Harmony
Set these in .env or your secret vault of choice. Defaults may exist, but defaults are for Betelgeusians.

CodeServer
CODESERVER_HASHED_PASSWORD – Encrypt your entry! Even Marvin had a password.

WORKSPACEMOUNT – Absolute path to your development directory.

(Optional) Customize mods with DOCKER_MODS, or let CodeServer speak Python, NodeJS, AWS CLI, and Docker by default.

Hoppscotch
HOPPSCOTCH_DATABASE_URL – URL to a database that won’t implode.

HOPPSCOTCH_JWT_SECRET – Your security blanket for token-based auth.

HOPPSCOTCH_SESSION_SECRET – Just like it sounds, but more cryptic.

HOPPSCOTCH_MAILER_SMTP_URL, HOPPSCOTCH_MAILER_ADDRESS_FROM – For summoning email magic.

HOPPSCOTCH_DATA_ENCRYPTION_KEY – If it’s not encrypted, it’s probably already in the Vogon registry.

Woodpecker
WOODPECKER_GITHUB_CLIENT, WOODPECKER_GITHUB_SECRET – So your CI pipeline knows who you are (and isn’t paranoid about it).

WOODPECKER_AGENT_SECRET – Like a towel for your agents: essential.

🛰 Routing the Infinite Requests
This stack assumes Traefik is the reverse proxy wrangler and that you’ve already mastered it like Zaphod did with the Heart of Gold.

Domains in use:

code.cityzen.co.za → CodeServer

apilab.cityzen.co.za, admin.apilab.cityzen.co.za → Hoppscotch frontend/admin

ci.cityzen.co.za → Woodpecker CI

proxyscotch.cityzen.co.za → ProxyScotch

All secured with TLS and guarded by Authelia (or a very annoyed Marvin).

⚙️ Volumes, Networks, and Space-Time Configs
All services use internal and external Docker networks.

Configs and logs live in ${DOCKERDIR}, typically /home/homelab/conf.

Logs float safely in ${LOGS} unless redirected to a black hole.

🧞 Script-less Automation
Woodpecker CI builds your projects. Hoppscotch explores your APIs. CodeServer writes your destiny. ProxyScotch whispers sweet HTTP requests. It’s like magic, but reproducible.

☠️ Warning
If you see anything defaulting to password=, slap yourself with a fish and change it.

🧬 Future Ideas
Add self-diagnostics via Marvin’s Mood Logger™

Expand to include AI pair programmers (so long as they’re nicer than Eddie)

Allow time-travel debugging (pending LHC compatibility)

