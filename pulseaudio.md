# PulseAudio

The default i3 config uses PulseAudio to control audio.
This is done through the `pactl` cli command.
Debian does not have PulseAudio installed by default.

## Installation
```sh
sudo apt install pulseaudio
```

## Configuration
Using pactl right away to control audio resulted in a `Connection refused` error message.
First run `pactl get-default-sink`.
After this `pactl` should work properly.

## Configuring i3
The default keybindings in the i3 config are usually ok, but you might need to use `xev` to discover the keycodes for your machine's volume and mute buttons.

