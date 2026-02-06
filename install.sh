#!/bin/bash

echo "🔧 Setting GSM sebagai koneksi UTAMA dan WiFi sebagai CADANGAN..."

# Tunggu NetworkManager siap
sleep 3

# Cari connection GSM berdasarkan interface
GSM_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wwan0qmi0:gsm" | cut -d: -f1)

# Cari connection WiFi berdasarkan interface
WIFI_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wlan0:wifi" | cut -d: -f1)

# Validasi GSM
if [ -n "$GSM_CONN" ]; then
    echo "📶 GSM connection ditemukan: $GSM_CONN"
    nmcli connection modify "$GSM_CONN" \
        ipv4.route-metric 100 \
        connection.interface-name wwan0qmi0
else
    echo "❌ GSM connection (wwan0qmi0) tidak ditemukan!"
fi

# Validasi WiFi
if [ -n "$WIFI_CONN" ]; then
    echo "📡 WiFi connection ditemukan: $WIFI_CONN"
    nmcli connection modify "$WIFI_CONN" \
        ipv4.route-metric 600 \
        connection.interface-name wlan0
else
    echo "❌ WiFi connection (wlan0) tidak ditemukan!"
fi

# Restart koneksi
if [ -n "$GSM_CONN" ]; then
    nmcli connection down "$GSM_CONN" || true
    nmcli connection up "$GSM_CONN"
fi

if [ -n "$WIFI_CONN" ]; then
    nmcli connection down "$WIFI_CONN" || true
    nmcli connection up "$WIFI_CONN"
fi

echo "✅ Routing priority selesai"
echo "➡ GSM (wwan0qmi0) = UTAMA"
echo "➡ WiFi (wlan0) = CADANGAN"
