#!/usr/bin/env bash
set -euo pipefail

CERT_DIR="/tmp/csot-tls"
CERT="$CERT_DIR/server.crt"
KEY="$CERT_DIR/server.key"
CONF="$CERT_DIR/nginx.conf"

mkdir -p "$CERT_DIR"

# Generate self-signed cert
openssl req -x509 -nodes -days 365 -newkey rsa:2048 \
    -keyout "$KEY" \
    -out "$CERT" \
    -subj "/CN=localhost" 2>/dev/null

# Write nginx config
cat > "$CONF" <<NGINX
events {
    worker_connections 64;
}
http {
    server {
        listen 8443 ssl;
        server_name localhost;

        ssl_certificate     $CERT;
        ssl_certificate_key $KEY;

        ssl_protocols TLSv1.2 TLSv1.3;

        location / {
            return 200 "Hello from HTTPS\\n";
            add_header Content-Type text/plain always;
        }
    }
}
NGINX

# Start nginx with our config
nginx -c "$CONF"

exit 0
