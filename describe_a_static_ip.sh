
source ./set_p.sh

echo LIST:
echo
gcloud compute addresses list | sort
echo
echo

echo
echo -n "ENTER IP_NAME: "
read IP_NAME
echo

echo
gcloud compute addresses describe $IP_NAME
echo
