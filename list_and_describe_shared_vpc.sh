
source ./set_p.sh

echo ______________________________________________________________
gcloud compute networks list 
echo
sleep 1

echo
echo ENTER NETWORK:
read NETWORK
echo
gcloud compute networks describe $NETWORK
echo
