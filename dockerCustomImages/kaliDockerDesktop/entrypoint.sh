#!/bin/bash

# Ensure the log and run directories exist for XRDP
mkdir -p /var/run/xrdp
mkdir -p /var/log/xrdp

echo "Starting the XRDP service in the foreground..."

# Start the XRDP server. The '-n' flag tells it not to daemonize (run in background), 
# which is essential for Docker's single-process model.
exec /usr/sbin/xrdp -n