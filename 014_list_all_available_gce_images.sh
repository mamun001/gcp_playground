#!/bin/bash

gcloud compute images list  | sort
echo
gcloud compute images list  | wc -l
echo
echo
gcloud compute images list  | grep -i ubuntu 
echo
echo
gcloud compute images list  | grep -i windows
