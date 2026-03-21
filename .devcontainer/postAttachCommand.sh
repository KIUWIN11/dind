clear

# Wait for tailscaled to start
sleep 3

# Connect to Tailscale, skip if timeout after 15s
timeout 15 tailscale up --hostname codespaces --advertise-exit-node --qr 2>/dev/null || true

clear

echo "IPv4: $(tailscale ip --4 2>/dev/null || echo 'Not connected')"
echo "IPv6: $(tailscale ip --6 2>/dev/null || echo 'N/A')"
echo "DNS: $(tailscale whois $(tailscale ip --4 2>/dev/null) 2>/dev/null | grep -oP '[a-z0-9-]+\.[a-z0-9-]+\.ts\.net' || echo 'N/A')"
