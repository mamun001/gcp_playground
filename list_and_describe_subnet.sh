
source set_p.sh


# examples

echo ________________________________________________________
echo list of subnets:
#gcloud compute networks subnets list | grep -v default | grep us-central | sort
gcloud compute networks subnets list | sort
echo
echo ENTER SUBNET:
read SUBNET
echo

echo ________________________________________________________
gcloud compute networks subnets describe $SUBNET
echo ________________________________________________________
