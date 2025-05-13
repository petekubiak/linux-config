#/bin/bash

sudo ip link set dev wlp4s0 up

echo "Scanning..."
ssids=$(sudo iwlist wlp4s0 scan | grep ESSID | sed 's/ESSID:/\n/g')

echo
echo "Found SSIDS:"
for ssid in "$ssids"
do
  echo "$ssid\n"
done

read -p "Enter SSID:" ssid
read -p "Enter passphrase:" pass

wpa_passphrase "$ssid" "$pass"| sudo tee -a /etc/wpa_supplicant/wpa_supplicant.conf

sudo wpa_supplicant -B -c /etc/wpa_supplicant/wpa_supplicant.conf -i wlp4s0
