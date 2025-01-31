#!/bin/bash

# long output
#gcloud compute instances list --format=json


echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo


echo
echo COUNT:
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())'   | sort | wc -l
echo
echo
sleep 7
echo
echo -n KEYWORD TO SEARCH FOR: 
read KW
echo
#works only name and zone
gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $KW | cut -c1-110
#echo TERMINATED COUNT:
#gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $KW | cut -c69-150 | grep TERMINATED | wc -l
#echo ANY VM NOT TERMINATED COUNT:
#gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $KW | cut -c69-150 | grep -v TERMINATED | wc -l
echo
echo
sleep 7


# choose

echo
echo -n "ENTER INSTANCE NAME to describe: "
read INS_NAME


#find zone
ZONE=`gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $INS_NAME | awk '{print $2}'`
echo zone for this instance = $ZONE


# describe
echo
echo
#works fine
gcloud compute instances describe $INS_NAME --zone $ZONE 
# get machine type only . works
#gcloud compute instances describe $INS_NAME --zone $ZONE --format='table(machineType)'
echo

