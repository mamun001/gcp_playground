#!/bin/bash

gcloud compute instances create ansible-control-node \
    --project=youtube-demo-3-367300 \
    --zone=us-west1-a \
    --machine-type=n1-standard-2 \
    --boot-disk-size=20GB \
    --image-family=ubuntu-2004-lts \
    --image-project=ubuntu-os-cloud

gcloud compute instances create ansible-target-node-1 \
    --project=youtube-demo-3-367300 \
    --zone=us-west1-a \
    --machine-type=n1-standard-2 \
    --boot-disk-size=20GB \
    --image-family=ubuntu-2004-lts \
    --image-project=ubuntu-os-cloud

gcloud compute instances create ansible-target-node-2 \
    --project=youtube-demo-3-367300 \
    --zone=us-west1-a \
    --machine-type=n1-standard-2 \
    --boot-disk-size=20GB \
    --image-family=ubuntu-2004-lts \
    --image-project=ubuntu-os-cloud

