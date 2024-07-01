#!/bin/bash



echo ____________________________________________________________________________________
echo
echo First lets get a list of SAs in this project:
echo
gcloud iam service-accounts list | grep EMAIL
echo
gcloud iam service-accounts list | grep -v EMAIL | sort
echo

