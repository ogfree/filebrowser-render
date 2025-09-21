# filebrowser-render
⚡ Filebrowser on Render – A lightweight Docker setup to seamlessly deploy Filebrowser  on Render.com . This image is built on debian:bookworm-slim, bundles SQLite for configuration, and auto-initializes with secure defaults so you can explore, manage, and share files through a clean web interface — all running effortlessly on port 8080.



---

# 🌟 Filebrowser on Render 🌟

Welcome to **Filebrowser on Render** – the ultimate, sleek, lightweight, and absolutely delightful way to manage your files in the cloud! 🚀

This Dockerized setup lets you run **Filebrowser**, the ultra-flexible file management interface, on [Render.com](https://render.com/) effortlessly. Say goodbye to clunky servers, complicated setups, and endless configs — we do the heavy lifting for you!

---

## ✨ Features

* **Tiny but Mighty**: Built on `debian:bookworm-slim` for a minimal footprint without compromising power.
* **Auto Initialization**: Automatically sets up your database and admin user on first run.
* **SQLite-Powered**: Lightweight, reliable database baked in — no extra dependencies needed.
* **Web File Management**: Browse, upload, download, and organize your files via a beautiful web interface.
* **Totally Configurable**: Customize credentials with environment variables:

  * `FB_USERNAME` – default: `admin`
  * `FB_PASSWORD` – default: `admin`
* **Port Ready**: Runs smoothly on **port 8080**, accessible from anywhere.
* **Containerized**: All-in-one Dockerfile – just build, deploy, and go!

---

## 🚀 Quick Start

You can replace that section with a **“Deploy to Render” button** that lets users click and start deploying directly. Render supports this using a URL with your GitHub repo. Here’s how your updated section could look:

---

## 🚀 Quick Start


Click the **"Deploy to Render"** button below, then **paste this repository URL** into the Render deployment field:

```
https://github.com/ogfree/filebrowser-render
```

[![Deploy to Render](https://render.com/images/deploy-to-render-button.svg)](https://dashboard.render.com/web/new)

> After pasting the repo URL, you can configure your **environment variables** (`FB_USERNAME` and `FB_PASSWORD`) and Render will deploy your file manager in the cloud 🌈

---

## 🖌️ Dockerfile Highlights

```dockerfile
FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y wget ca-certificates sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /filebrowser https://github.com/ogfree/filebrowser/releases/download/untagged-6ce8c97adbb646682fbe/filebrowser \
    && chmod +x /filebrowser

EXPOSE 8080

CMD ["/bin/sh", "-c", "\
  if [ ! -f /filebrowser.db ]; then \
    /filebrowser --database /filebrowser.db config init && \
    /filebrowser --database /filebrowser.db users add ${FB_USERNAME:-admin} ${FB_PASSWORD:-admin} --perm.admin; \
  fi && \
  exec /filebrowser --database /filebrowser.db --address 0.0.0.0 --port 8080 --root / \
"]
```

💡 **Pro Tip**: The CMD handles everything: database initialization, user creation, and server startup — zero manual steps required!

---

## 🎨 Why You’ll Love It

* Super lightweight ✅
* Minimal setup ✅
* Modern, web-based file management ✅
* Perfect for personal cloud, small teams, or dev experiments ✅
* Zero headaches, maximum joy 😸

---

## ⚡ Environment Variables ()

| Variable      | Default | Description    |
| ------------- | ------- | -------------- |
| `FB_USERNAME` | `admin` | Admin username |
| `FB_PASSWORD` | `admin1234567890` | Admin password |

---

## 🌍 Access

Open your browser and navigate to:

```
http://<your-render-service>.onrender.com
```

Login with your credentials and enjoy effortless file management. 🎉

---

## ❤️ Contributing

We love contributions, ideas, or cute emojis in PRs! 😻

1. Fork the repo
2. Make your magic ✨
3. Submit a PR

---

## 🐳 License

MIT License – Do whatever you want, just don’t break the internet. 😉

---

> **Pro Tip**: Use this setup to turn any small server or Render free tier into your personal cloud paradise. 🌈


