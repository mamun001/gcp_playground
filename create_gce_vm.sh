#!/bin/bash

#gcloud projects list

# Get a list of running VMs
gcloud compute instances list --project youtube-demo-3-367300
printf '\n\n\n'

# Create a VM
gcloud compute instances create test-vm-1 --project youtube-demo-3-367300 --machine-type=n1-standard-2 --zone=us-west1-a --boot-disk-size=20GB --image=centos-7-v20210316  --image-project centos-cloud 
printf '\n\n\n'

# Get a list of running VMs again
gcloud compute instances list --project youtube-demo-3-367300
printf '\n\n\n'