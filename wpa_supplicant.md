# Connecting to a wireless network

## Step 1: Identify wireless interface
```sh
ip link
```
Look for something like `wlp4s0`, `wlan0` or similar/.

## Step 2: Scan for available networks
```sh
sudo iw dev wlp4s0 scan | grep SSID
```
If there is an error, e.g. `command failed: Device or resource busy (-16)`, it is likely something is already using the interface.
If so, run
```sh
ps aux | grep -E 'wpa_supplicant|NetworkManager'
```
and use
```sh
sudo systemctl stop wpa_supplicant
sudo systemctl stop NetworkManager
```
to stop the running services.
Use
```sh
sudo killall wpa_supplicant
```
to kill any lingering processes.

## Step 3: Generate the wpa_supplicant config
```sh
wpa_passphrase "SSID" "password" | sudo tee /etc/wpa_supplicant/wpa_supplicant.conf
```

## Step 4: Start wpa_supplicant
```sh
sudo wpa_supplicant -B -i <interface> -c /etc/wpa_supplicant/wpa_supplicant.conf
```
Then check if the connection was successful:
```sh
sudo iw <interface> link
```

## Step 5: Get an IP (if required)
This may happen automatically, but if not:
```sh
sudo dhclient <interface>
```
