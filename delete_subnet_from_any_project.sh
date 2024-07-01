
source set_p.sh
echo


echo "################################################################################"
echo
echo List of Subnets:
echo
gcloud compute networks subnets list | grep -v default | sort
echo
sleep 3


echo "################################################################################"
echo
echo -n "ENTER A SUBNET TO DELETE: "
read SUBNET
echo 
echo -n "ENTER REGION: "
read REGION
echo 
echo deleting $SUBNET
echo
sleep 5
#gcloud compute networks subnets delete $SUBNET  --region $REGION
echo


