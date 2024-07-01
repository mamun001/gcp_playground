#!/bin/bash

gcloud compute addresses list | awk '{print $2}' | sort -n > ./tmp.ips
echo
cat ./tmp.ips
echo



