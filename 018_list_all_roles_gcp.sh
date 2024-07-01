#!/bin/bash

#source ./set_p.sh

echo
echo
gcloud iam roles list | grep name | sort 
echo
echo Number of Roles:
echo
gcloud iam roles list | grep name | sort | wc -l
echo
echo


