# 📡 data-core  
*“The neural center of your homelab — because even chaos needs a database.”*

> “Time is an illusion. Lunchtime doubly so. Your database backup strategy? Triply so.”  
> — *The Guide*

---

## 🧠 What Is This Stack, Anyway?

This is the **Data Core**, the big-brained part of your homelab. It stores everything your services mutter to themselves in the dark:

- 🐘 PostgreSQL: The dependable librarian of structured data
- 🧠 Qdrant: The hip new vector database that thinks in semantic dimensions you’ll never quite understand
- 🔥 Redis: A memory store with the attention span of a caffeinated squirrel
- 🧮 phpMyAdmin: A GUI for SQL wizards and panicked sysadmins alike

It is the core from which everything else flows. Or breaks. Often both.

---

## ⚙️ Minimum Viable Variables

You must provide the following `.env` variables if you’d like your data-core stack to do anything other than sulk quietly.

### 🐘 PostgreSQL

| Variable             | Default                    | Commentary |
|----------------------|----------------------------|------------|
| `POSTGRES_USER`      | `postgres`                 | Yes, everyone uses this. No, you shouldn’t. |
| `POSTGRES_PASSWORD`  | `POSTGRES-ChAnGeM3#`       | If you left this default, **please** don't expose this stack to the internet. Ever. |

> “Your database password should not be guessable by a mildly curious dolphin.” — *The Guide*

---

### 🔥 Redis

| Variable           | Default                   |
|--------------------|---------------------------|
| `REDIS_PASSWORD`   | `REDIS-ChAnGeM3#`         |

> Redis: fast, volatile, and only slightly dangerous when unsecured.

---

### 🧮 phpMyAdmin

| Variable         | Default                               |
|------------------|---------------------------------------|
| `PMA_PASSWORD`   | `Ifeel2StupidForNotChangingThis`      |

> This is not a password. This is a *cry for help*. Change it.

---

### 🧠 Qdrant

No required variables by default, which is charmingly optimistic.  
Want to protect your API? **Set an API key.** Otherwise, Qdrant will accept requests from any entity that can type and spell "curl".

---

### 📁 Volumes and Storage

| Variable | Default       | Use Case |
|----------|---------------|----------|
| `PGDATA` | `./pgdata`    | Where PostgreSQL keeps your data safe. Probably. Maybe. |

Pro tip: Use an absolute path if you don’t like waking up to “No such file or directory” errors at 2:37am.

---

## 🧪 Initialization Script: `init-db.sh`

Have multiple services fighting over one Postgres server like it's the last towel on a hyperspace cruise?

Use the `scripts/init-db.sh` script to:

- Create a new user (if they don’t already exist — very existential)
- Create a new database (ditto)
- Assign the database to the user, peacefully, like a benevolent despot

### 🧬 Required Variables for Script

| Variable               | Meaning |
|------------------------|---------|
| `POSTGRES_ADMIN_USER`  | The god-mode user (default: `postgres`) |
| `POSTGRES_ADMIN_PASSWORD` | His/her/its sacred password |
| `POSTGRES_HOST`        | Usually just `postgres` or the name of the service |
| `POSTGRES_PORT`        | 5432. Always. Because the universe is occasionally consistent. |
| `POSTGRES_USER`        | The new mortal you’re creating |
| `POSTGRES_PASSWORD`    | Their not-so-sacred password |
| `POSTGRES_DB`          | Their tiny, exclusive data planet |

### 🏗️ How to Use

```sh
./scripts/init-db.sh


🔮 Future Ridiculousness
Because this isn’t just a database stack. It’s the Data Core. And it has aspirations. Terrifying ones.

🛸 Galactic Federation Compliance Mode
Implement a federation-aware Postgres layer that reports anomalies to a quorum of distributed sentient AIs (or just Prometheus and Loki with a God complex).

🧬 Auto-Evolving Schemas
Why write migrations manually when your database can guess what you meant and rewrite its structure daily like a reality TV reboot?

🪐 Time-Series Quantum Entanglement
Add support for time-traveling inserts. Accidentally drop a table? Roll back to last Tuesday before you typoed that DROP DATABASE.

🤯 Vector Oracle
Extend Qdrant to hallucinate the answer to questions you never asked. Basically, a semantic Magic 8 Ball trained on your logs and regrets.

☄️ Redis-Sentient Mode
Give Redis enough memory and logs to develop an attitude. It'll start refusing writes it finds boring and prioritizing requests from services it "likes."

🕶️ phpMyAdmin Dark Mode++
Replace the UI with a command-line terminal that whispers advice based on your queries. Comes with randomized sound effects for every DELETE.

📡 Intergalactic Replication Mesh
Replicate your data to off-world data centers (read: Raspberry Pis duct-taped to drones). High latency? Yes. High availability? Also yes. Kind of.


