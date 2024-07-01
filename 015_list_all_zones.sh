#!/bin/bash

echo
gcloud compute zones list | sort
echo ; echo
gcloud compute zones list | wc -l

