#!/bin/bash

# Load environment variables from .env file
if [ -f .env ]; then
    export $(cat .env | xargs)
fi

# Check if TOKEN and NETWORK_ID are set
if [ -z "$TOKEN" ] || [ -z "$NETWORK_ID" ]; then
    echo "Error: TOKEN or NETWORK_ID is not set. Please check your .env file."
    exit 1
fi

# Fetch data using curl and format with jq
curl -s -H "Authorization: bearer $TOKEN" \
"https://api.zerotier.com/api/v1/network/$NETWORK_ID/member" | jq .

