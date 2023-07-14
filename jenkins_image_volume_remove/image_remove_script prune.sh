#!/bin/bash

days=$DAYS
hours=$((days * 24))
# it will remove all unused resources that are some Days older, including images, containers and networks 
docker system prune -af --volumes --filter "until=${hours}h"
# it will remove all unused volumes
docker volume prune -f
