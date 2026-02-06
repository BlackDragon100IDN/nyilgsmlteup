HASIL AKHIR

Install sekali jalan
curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/install.sh | sudo bash


Tidak tergantung nama WiFi

GSM selalu utama

WiFi otomatis backup

Aman walau SSID ganti-ganti

Cek hasil:

ip route


Harus muncul:

default dev wwan0qmi0 metric 100
default dev wlan0     metric 600
