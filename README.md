# nyilgsmlteup

## 📡 GSM Utama – WiFi Cadangan (Auto Routing)

Script ini digunakan untuk **mengatur prioritas koneksi jaringan secara otomatis** menggunakan NetworkManager:

- **GSM / LTE (wwan0qmi0) = UTAMA**
- **WiFi (wlan0) = CADANGAN**
- Tidak tergantung nama WiFi / SSID
- Aman walau SSID WiFi sering ganti
- Install & uninstall **cukup satu perintah**

---

## 🚀 Install (Sekali Jalan)

Langsung **copy–paste satu perintah ini**:

```bash
curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/install.sh | sudo bash
```

🔥 **Itu saja. Selesai.**

### Hasil setelah install
- GSM selalu dipakai sebagai jalur internet utama
- WiFi otomatis jadi backup jika GSM putus
- Begitu GSM hidup lagi → langsung jadi utama

---

## 🔍 Cek Hasil

Jalankan:

```bash
ip route
```

Harus muncul:

```text
default dev wwan0qmi0 metric 100
default dev wlan0     metric 600
```

Artinya:
- ✅ GSM = prioritas utama
- ✅ WiFi = cadangan

---

## 🧹 Uninstall (Balik ke Normal)

Untuk **menghapus semua setting** dan mengembalikan ke kondisi default NetworkManager:

### ▶️ Satu perintah saja

```bash
curl -fsSL https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/uninstall.sh | sudo bash
```

✅ **Selesai.**

---

## 🔁 Alternatif (jika `curl` tidak tersedia)

```bash
wget -qO- https://raw.githubusercontent.com/BlackDragon100IDN/nyilgsmlteup/main/uninstall.sh | sudo bash
```

---

## 🔍 Cek Setelah Uninstall

```bash
ip route
```

Hasil:
- Routing kembali normal
- NetworkManager bebas menentukan prioritas koneksi

---

## ⚠️ Catatan Penting

- Script **tidak menghapus** koneksi WiFi atau GSM
- Script **tidak mengubah APN**
- Script hanya mengatur / mereset **routing priority**

---

## 🧠 Cocok untuk

- Router Linux
- VPS + USB LTE modem
- Mini PC / SBC (OpenWRT-like environment dengan NetworkManager)

---

🔥 Dibuat untuk setup cepat, simpel, dan stabil.

Jika ingin fitur lanjutan seperti auto monitoring, watchdog modem, atau failover agresif — silakan modifikasi atau fork repo ini.


---

## 👤 Author

**Storm81**

