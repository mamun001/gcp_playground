#!/bin/bash


echo ______________________________________________________________________________
echo
echo sometimes subnet name is same as VPC name
echo sometimes subnet name is same as VPC name
echo sometimes subnet name is same as VPC name
sleep 3


echo ______________________________________________________________________________
echo
echo
echo List of Subnets:
echo "SUBNET-NAME                           REGION                   NETWORK                       RANGE"
echo
gcloud compute networks subnets list  | sort
echo



echo ______________________________________________________________________________
echo 
echo ENTER SUBNET TO DESCRIBE:
read SUBNET

gcloud compute networks subnets describe $SUBNET
echo
echo ______________________________________________________________________________
