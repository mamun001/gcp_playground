#!/bin/bash

source ./set_p.sh



echo ____________________________________________________________________________________________
echo 
echo LIST OF SERVICE ACCOUNTS IN THIS PROJECT:
echo
echo count:
gcloud projects get-iam-policy $PROJECT --format='json(bindings)' | grep serviceAccount: | sort | uniq | cut -d: -f2 | cut -d\" -f1 | uniq | wc -l
echo
echo 
sleep 1
gcloud projects get-iam-policy $PROJECT --format='json(bindings)' | grep serviceAccount: | sort | uniq | cut -d: -f2 | cut -d\" -f1 | uniq  > ./tmp.sa
echo


echo 
echo -n "enter word to search SAs: "
read KW
echo


echo
grep $KW ./tmp.sa
echo



echo
echo -n "ENTER SA: e.g. terraform@terraform-admin-prj.iam.gserviceaccount.com: "
read SA
#SA=terraform@terraform-admin-prj.iam.gserviceaccount.com
echo


echo ____________________________________________________________________________________________
echo Roles $SA Has on $PROJECT
echo
gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  | grep : | egrep "role|$SA" | grep -A1 "$SA" | grep : | grep -v "$SA"
echo ____________________________________________________________________________________________

