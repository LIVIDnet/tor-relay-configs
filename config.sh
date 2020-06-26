#!/usr/bin/env bash

# This script presumes that you've installed Tor on your system.

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
    cp -rf usr/* /usr

    # modify/remove the next two lines if you're planning to change the log location
    mkdir /var/log
    mkdir /var/log/tor
    chown tor:tor /var/log/tor

    # creates data directories for the tor bridge
    mkdir /var/lib/tor-bridge
    chown tor:tor /var/lib/tor-bridge

    # activates NTP service, due to the Raspberry Pi 4B+ not possessing a
    # physical, real-time clock. tor requires an accurate clock to work.
    timedatectl set-ntp true

    # assumes that you're running systemd
    echo "Configuring systemd so that Tor starts on boot..."
    systemctl daemon-reload
    systemctl enable --now tor
    systemctl enable --now tor-bridge
    echo "Attempting to restart Tor services..."
    systemctl restart tor
    systemctl restart tor-bridge
    echo "Done!"
fi
