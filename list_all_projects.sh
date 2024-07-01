#!/bin/bash

echo 


echo ______________________________________________________________________________________________________
echo
echo projects list:
echo
gcloud projects list | sort  | grep -v ^sys
gcloud projects list | sort  | grep -v ^sys > ./tmp.projects
echo
echo
echo SRE only:
grep sre ./tmp.projects | sort
sleep 2


exit 0


