#!/bin/bash

# Check if the user provided username and server IPs as input
if [ -z "$1" ] || [ -z "$2" ]; then
  echo "Usage: $0 <username> <comma-separated-server-ips>"
  exit 1
fi

username="$1"
# Split the input into an array of IPs
IFS=',' read -r -a server_ips <<< "$2"

# Loop through each IP and perform SSH 
# And run ls -ltr inside "/apps/imdg/hazelcast-5.5.1" each of them 
# And concatinate the result in output.log file
for ip in "${server_ips[@]}"; do
  echo "Connecting to $username@$ip..."
  result=$(ssh "$username@$ip" "ls -ltr /apps/imdg/hazelcast-5.5.1")
  if [ $? -eq 0 ]; then
    echo "Result from $username@$ip:"
    echo "$result"
    echo "Result from $username@$ip:" >> output.log
    echo "$result" >> output.log
  else
    echo "Failed to connect to $username@$ip or execute command"
    echo "Failed to connect to $username@$ip or execute command" >> output.log
  fi
done
