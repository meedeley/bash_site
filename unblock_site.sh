#!/bin/bash

# List of websites to unblock
UNBLOCKED_SITES=(
     "chatgpt.com"
    "claude.ai"
    "gemini.google.com"
    "https://gemini.google.com/app?hl=id"
)

# Get root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Loop through unblocked sites and remove them from hosts file
for site in "${UNBLOCKED_SITES[@]}"; do
    if grep -q $site /etc/hosts; then
        echo "Unblocking $site..."
        sed -i "/$site/d" /etc/hosts
    else
        echo "$site is already unblocked."
    fi
done

echo "All sites have been unblocked."