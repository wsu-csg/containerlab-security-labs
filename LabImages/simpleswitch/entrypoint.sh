#!/bin/sh

BRIDGE=br0

# Create bridge
ip link add name br0 type bridge
ip link set br0 up
echo 0 > /sys/class/net/br0/bridge/stp_state

# Wait and add interfaces as they appear
while true; do
    for iface in $(ls /sys/class/net/ | grep -E '^eth[1-9]'); do
        # Check if not already in a bridge
        if [ ! -f "/sys/class/net/$iface/master" ]; then
            ip link set "$iface" up
            ip link set "$iface" master br0
            echo "Bridged $iface"
        fi
    done
    sleep 1
done