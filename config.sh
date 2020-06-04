#!/usr/bin/env bash

if [[ $EUID -ne 0 ]];
then
    echo "Please run this script as root."
    exit
fi

echo "This script will forcefully overwrite your existing dnsmasq configurations."
read -p "Are you sure you want to continue? [y/N] " warning

if [[ $warning =~ [yY]* ]]
then
    cp -rf etc/* /etc
    # modify/remove the next two lines if you're planning to change the log location
    mkdir /var/log
    mkdir /var/log/tor
    chown tor /var/log/tor
fi

# activates NTP service, due to the Raspberry Pi 4B+ not possessing a
# physical, real-time clock. tor requires an accurate clock to work.
timedatectl set-ntp true

# assumes that you're running systemd
echo "Configuring systemd so that Tor starts on boot..."
systemctl enable --now tor
echo "Attempting to restart tor..."
systemctl restart tor
echo "Done!"
