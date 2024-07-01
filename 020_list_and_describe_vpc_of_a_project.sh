#!/bin/bash

echo _________________________________________________________________________
gcloud compute networks list 
echo
echo ENTER a NETWORK to describe
read NETWORK
sleep 1



echo _________________________________________________________________________
echo
gcloud compute networks describe $NETWORK
echo
