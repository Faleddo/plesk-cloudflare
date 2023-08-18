#!/bin/bash
# Check if the script is run as root
if [[ $EUID -ne 0 ]]; then
   echo "This script must be run as root." 
   exit 1
fi

# List of IP addresses and ranges to whitelist
ip_ranges=(
    "173.245.48.0/20"
    "103.21.244.0/22"
    "103.22.200.0/22"
    "103.31.4.0/22"
    "141.101.64.0/18"
    "108.162.192.0/18"
    "190.93.240.0/20"
    "188.114.96.0/20"
    "197.234.240.0/22"
    "198.41.128.0/17"
    "162.158.0.0/15"
    "104.16.0.0/13"
    "104.24.0.0/14"
    "172.64.0.0/13"
    "131.0.72.0/22"
    "2400:cb00::/32"
    "2606:4700::/32"
    "2803:f800::/32"
    "2405:b500::/32"
    "2405:8100::/32"
    "2a06:98c0::/29"
    "2c0f:f248::/32"
)

# Plesk command to add trusted IP addresses
plesk_command="plesk bin ip_ban --add-trusted"

# Loop through the IP ranges and whitelist them
for ip_range in "${ip_ranges[@]}"; do
    $plesk_command "$ip_range"
done

echo "IP whitelisting completed."
