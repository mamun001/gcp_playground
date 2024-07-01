
source ./set_p.sh
sleep 5


echo LIST:
echo
gcloud compute addresses list | sort
echo
echo
sleep 5

echo -n "ENTER IP_NAME to delete: "
read IP_NAME
echo
echo IP_NAME=$IP_NAME
echo
echo deleting IP
echo
sleep 5
gcloud compute addresses delete foo
