
source ./set_p.sh
echo
echo
sleep 5

echo
echo ENTER VPC_NAME: e.g. dummy-qa-shared-net
read VPC_NAME
echo

echo _________________________________________________________________________
echo 
echo creating vpc
echo
sleep 2
#gcloud compute networks create kubernetes
# need default network for creating gke cluster
gcloud compute networks create $VPC_NAME
echo 
echo should be done

