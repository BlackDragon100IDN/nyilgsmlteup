echo "========================================="
echo " Setting Routing Priority (GSM > WiFi)"
echo "========================================="

sleep 3

# Detect GSM connection by interface
GSM_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wwan0qmi0:gsm" | cut -d: -f1)

# Detect WiFi connection by interface
WIFI_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wlan0:wifi" | cut -d: -f1)

# Set GSM as PRIMARY
if [ -n "$GSM_CONN" ]; then
    echo "[OK] GSM connection ditemukan: $GSM_CONN"
    nmcli connection modify "$GSM_CONN" \
        ipv4.route-metric 100 \
        connection.interface-name wwan0qmi0
else
    echo "[WARN] GSM (wwan0qmi0) tidak ditemukan"
fi

# Set WiFi as BACKUP
if [ -n "$WIFI_CONN" ]; then
    echo "[OK] WiFi connection ditemukan: $WIFI_CONN"
    nmcli connection modify "$WIFI_CONN" \
        ipv4.route-metric 600 \
        connection.interface-name wlan0
else
    echo "[WARN] WiFi (wlan0) tidak ditemukan"
fi

# Restart connections
if [ -n "$GSM_CONN" ]; then
    nmcli connection down "$GSM_CONN" 2>/dev/null || true
    nmcli connection up "$GSM_CONN"
fi

if [ -n "$WIFI_CONN" ]; then
    nmcli connection down "$WIFI_CONN" 2>/dev/null || true
    nmcli connection up "$WIFI_CONN"
fi

echo "========================================="
echo " Routing priority aktif:"
echo " GSM  (wwan0qmi0) = UTAMA"
echo " WiFi (wlan0)     = CADANGAN"
echo "========================================="
