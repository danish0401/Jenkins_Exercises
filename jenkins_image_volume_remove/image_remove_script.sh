#!/bin/bash

# Store the list of image IDs in an array
images=($(docker images -q))

# Get the current date and time
now=$(date +%s)

# removal number of days taken as parameter
days=7
# Loop through the list of image IDs
for image in "${images[@]}"; do
  # Check if the image is used by any running containers

  if [ -z "$(docker ps -q -a --filter ancestor=$image)" ] || ! $(docker inspect -f '{{.State.Running}}' $(docker ps -q -a --filter ancestor=$image | head -n1)); then
    # If not, get the creation date of the image
    created=$(docker inspect -f '{{.Created}}' $image)

    # Convert the creation date to a timestamp
    created_timestamp=$(date -d "$created" +%s)

    # Calculate the difference between the current time and the creation time
    difference=$((now - created_timestamp))

    # Check if the difference is greater than 7 days
    if (( difference >= days * 24 * 60 * 60 )); then
      # If it is, remove the image
      docker rmi -f $image
    fi
  fi
done
