#!/bin/bash
# Get the current date and time
now=$(date +%s)

# Get a list of all volumes
volumes=($(docker volume ls -q))

# removal number of days taken as parameter
days=0

# Iterate over each volume
for volume in "${volumes[@]}"; do
  # Check if the volume is in use by a container
  in_use=$(docker ps -a --filter status=running --filter status=exited -q -f volume="$volume" | wc -l)

  # If the volume is not in use, delete it
  if [ "$in_use" -eq 0 ]; then
    # get the creation date of volume
    created=$(docker volume inspect -f '{{.CreatedAt}}' $volume)

    # Convert the creation date to a timestamp
    created_timestamp=$(date -d "$created" +%s)

    # Calculate the difference between the current time and the creation time
    difference=$((now - created_timestamp))

    # Check if the difference is greater than 7 days
    if (( difference >= days * 24 * 60 * 60 )); then
      # If it is, remove the volume
      docker volume rm $volume
    fi
  fi
done
