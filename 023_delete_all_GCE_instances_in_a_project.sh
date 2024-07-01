#!/bin/bash

# Set the project ID
PROJECT_ID="youtube-demo-3-367300"

# Set the project
gcloud config set project $PROJECT_ID

# List all instances in the project
instances=$(gcloud compute instances list --format="value(name,zone)")
echo
echo $instances
echo
echo
sleep 5

# Check if there are any instances to delete
if [ -z "$instances" ]; then
  echo "No instances found in the project $PROJECT_ID."
  exit 0
fi

# Loop through each instance and delete it
while IFS= read -r instance; do
  # Split the instance name and zone
  instance_name=$(echo $instance | awk '{print $1}')
  instance_zone=$(echo $instance | awk '{print $2}')

  echo "Deleting instance: $instance_name in zone: $instance_zone"
  
  # Delete the instance
  gcloud compute instances delete $instance_name --zone=$instance_zone --quiet
done <<< "$instances"

echo "All instances in the project $PROJECT_ID have been deleted."

