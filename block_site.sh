#!/usr/bin/bash

# List Of Website To Block
BLOCKED_SITES=(
    "chatgpt.com"
    "claude.ai"
    "gemini.google.com"
    "https://gemini.google.com/app?hl=id"
)


# Get Root Privileges
if [[ $EUID -ne 0 ]]; then 
    echo "This script must be run in root"
    exit 1
fi

# Loop 
for site in "${BLOCKED_SITES[@]}"; do 
    if grep -q $site /etc/hosts; then 
        echo "$site already blocked"
    else 
        echo "Blocking $site..."
        echo "127.0.0.1 $site" >> /etc/hosts
    fi
done

echo "All Site Already Blocked"