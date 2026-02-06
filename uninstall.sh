#!/bin/bash

echo "========================================="
echo " Uninstall nyilgsmlteup routing settings"
echo " Reset ke kondisi NORMAL"
echo "========================================="

sleep 2

# Detect GSM & WiFi connections
GSM_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wwan0qmi0:gsm" | cut -d: -f1)
WIFI_CONN=$(nmcli -t -f NAME,DEVICE,TYPE connection show | grep ":wlan0:wifi" | cut -d: -f1)

# Reset GSM
if [ -n "$GSM_CONN" ]; then
    echo "[RESET] GSM connection: $GSM_CONN"
    nmcli connection modify "$GSM_CONN" \
        ipv4.route-metric auto \
        connection.interface-name ""
else
    echo "[INFO] GSM connection tidak ditemukan"
fi

# Reset WiFi
if [ -n "$WIFI_CONN" ]; then
    echo "[RESET] WiFi connection: $WIFI_CONN"
    nmcli connection modify "$WIFI_CONN" \
        ipv4.route-metric auto \
        connection.interface-name ""
else
    echo "[INFO] WiFi connection tidak ditemukan"
fi

# Aktifkan kembali default behavior WiFi
nmcli device modify wlan0 ipv4.never-default no 2>/dev/null || true

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
echo " Uninstall selesai"
echo " Routing kembali ke default NetworkManager"
echo "========================================="
