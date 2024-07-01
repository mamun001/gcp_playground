#!/bin/bash

source ./009_set_project.sh
echo



# ZONE="us-west1-c" 
ZONE="us-central1-c" 

# For example
#gcloud compute machine-types list --project=${PROJECT} --filter=zone=${ZONE}
gcloud compute machine-types list --filter=zone=${ZONE} 
echo; echo
gcloud compute machine-types list --filter=zone=${ZONE}  | wc -l
echo; echo
gcloud compute machine-types list --filter=zone=${ZONE} | grep small
