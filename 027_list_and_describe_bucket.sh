#!/bin/bash


echo ________________________________________________________________
gsutil ls | sort
echo


echo ________________________________________________________________
echo
echo ENTER BUCKET: Just the the name :no slash or gs
read BUCKET

echo ________________________________________________________________
echo
gsutil ls -L -b gs://$BUCKET


