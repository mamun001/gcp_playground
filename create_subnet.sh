

source ./set_p.sh
echo
sleep 5

echo
echo ENTER SUBNET_NAME: e.g. foo
read SUBNET_NAME
echo

echo
echo ENTER existing VPC_NAME: e.g. dummy-qa-shared-net
read VPC_NAME
echo

echo
echo ENTER RANGE: e.g. 10.100.0.0/21
read RANGE
echo 

#gcloud compute networks subnets create NAME --network=NETWORK --range=RANGE
#gcloud compute networks subnets create arc-qa-cluster-primary --network=dummy-qa-shared-net --range=10.100.0.0/21
gcloud compute networks subnets create $SUBNET_NAME --network=$VPC_NAME --range=$RANGE


echo
echo


exit 0
arc-qa-cluster-primary        us-central1              shared-net  10.100.0.0/21
