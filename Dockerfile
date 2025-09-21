FROM debian:bookworm-slim

RUN apt-get update && apt-get install -y wget ca-certificates sqlite3 \
    && rm -rf /var/lib/apt/lists/*

RUN wget -O /filebrowser https://github.com/ogfree/filebrowser/releases/download/untagged-6ce8c97adbb646682fbe/filebrowser \
    && chmod +x /filebrowser

EXPOSE 8080

CMD ["/bin/sh", "-c", "\
  if [ ! -f /filebrowser.db ]; then \
    /filebrowser --database /filebrowser.db config init && \
    /filebrowser --database /filebrowser.db users add ${FB_USERNAME:-admin} ${FB_PASSWORD:-admin1234567890} --perm.admin; \
  fi && \
  exec /filebrowser --database /filebrowser.db --address 0.0.0.0 --port 8080 --root / \
"]
