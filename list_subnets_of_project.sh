
source ./set_p.sh

echo ______________________________________________________________________________
echo
echo sometimes subnet name is same as VPC name
echo sometimes subnet name is same as VPC name
echo sometimes subnet name is same as VPC name
sleep 3


echo ______________________________________________________________________________
echo
#gcloud compute networks subnets list | grep -v default | grep us-central | sort
echo
echo List of Subnets:
echo "SUBNET-NAME                           REGION                   NETWORK                       RANGE"
echo
gcloud compute networks subnets list  | sort
echo



echo ______________________________________________________________________________
echo 
echo ENTER SUBNET:
read SUBNET

gcloud compute networks subnets describe $SUBNET
echo
echo ______________________________________________________________________________
