HASIL AKHIR

Install sekali jalan Ini dia 👇 langsung copy–paste:

curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/install.sh | sudo bash

🔥 Itu saja. Selesai.

Tidak tergantung nama WiFi

GSM selalu utama

WiFi otomatis backup

Aman walau SSID ganti-ganti

Cek hasil:

ip route

Harus muncul:

default dev wwan0qmi0 metric 100 default dev wlan0 metric 600

satu perintah saja, sekali jalan buat UNINSTALL / BALIK NORMAL.

Langsung copy–paste ini 👇

curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/uninstall.sh | sudo bash

✅ Selesai.

🔁 Alternatif (kalau curl tidak ada) wget -qO- https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/uninstall.sh | sudo bash

🔍 Setelah jalan

Cek:

ip route

Harus sudah normal kembali (NetworkManager bebas atur).
