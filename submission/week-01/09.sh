#!/usr/bin/env bash
openssl req -x509 -newkey rsa:2048 \
    -keyout /tmp/key.pem \
    -out /tmp/cert.pem \
    -days 365 -nodes \
    -subj "/CN=localhost"

cat > /tmp/nginx-ssl.conf << 'NGINX'
server {
    listen 8443 ssl;
    ssl_certificate /tmp/cert.pem;
    ssl_certificate_key /tmp/key.pem;

    location / {
        return 200 "HTTPS works!\n";
    }
}
NGINX

echo "Certificate and nginx config created successfully"
