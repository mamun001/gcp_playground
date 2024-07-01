#!/bin/bash

echo ________________________________________________________________
echo
gcloud compute networks list | sort
echo

echo
echo ENTER NAME TO DESCRIBE
read NAME


echo ________________________________________________________________
echo
gcloud compute networks describe $NAME
echo

