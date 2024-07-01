#!/bin/bash


if [ "$#" -ne 1 ]; then
    echo "usage: ./script [PERSONAL1|PERSONAL2]"
    echo
    exit 1
fi

if [ "$1" = "PERSONAL1" ]; then
   PROJECT="youtube-demo-3-367300"
   gcloud auth activate-service-account --key-file=/Users/mamunrashid/demo3.json
   gcloud config set account for-kubectl-explain-demo@youtube-demo-3-367300.iam.gserviceaccount.com
   gcloud config set project $PROJECT
   export GOOGLE_APPLICATION_CREDENTIALS="/Users/mamunrashid/demo3.json"
   echo GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS
   gcloud config get-value project
   echo 
   echo post-check
   echo should see 27 below  for PERSONAL1
   gcloud services list | wc -l
   echo
   echo Should see 2 accounts below for PERSONAL1
   echo
   gcloud iam service-accounts  list 
   echo
   echo
   echo
   echo You should NOT see any GKE cluster below for PERSONAL1
   echo
   gcloud container clusters list
   echo
fi


if [ "$1" = "PERSONAL2" ]; then
   PROJECT="production"
   gcloud auth activate-service-account --key-file=/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json
   gcloud config set account johdoe@foo.com
   gcloud config set project $PROJECT
   export GOOGLE_APPLICATION_CREDENTIALS="/Users/mamunrashid/mrashid-cloud-armor-playground-625c382a120f-tf_mamun.json"
   echo GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS
   gcloud config get-value project
   echo 
   echo post-check
   gcloud services list | wc -l
   echo
   gcloud iam service-accounts  list  | wc -l
   echo
   gcloud container clusters list
   sleep 5
   gcloud compute instances list | wc -l
fi

exit 0



#  How to switch between 2 GCP accounts


# BETTER WAY
# RUN:
# gcloud auth list
#   You see
#                           Credentialed Accounts
#ACTIVE  ACCOUNT
#*       terraform-practice@youtubedemo-332106.iam.gserviceaccount.com
#
# To set the active account, run:
#    $ gcloud config set account `ACCOUNT`

#gcloud auth activate-service-account --key-file=/Users/mamunrashid/gcp-personal-youtubedemo-332106-e032f5671cea.json
#gcloud auth activate-service-account --key-file=/Users/mamunrashid/service-account-on-youtube-demo-2-project.json
gcloud auth activate-service-account --key-file=/Users/mamunrashid/demo3.json
exit 0




