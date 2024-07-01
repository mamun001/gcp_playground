

source ./set_p.sh
echo

echo _________________________________________________________________________
echo
echo
echo getting a list
echo
gcloud sql instances list | grep NAME
gcloud sql instances list | grep -i POSTG
gcloud sql instances list | grep -i MYSQL
echo
echo

echo _________________________________________________________________________
echo ENTER ID:
echo e.g. ms-test3
echo
read ID
echo
echo instance details:
echo
sleep 1
gcloud sql instances describe $ID --format=json
#gcloud sql instances describe $ID --format=json  | grep -i ipaddress
#gcloud sql databases list --instance=$ID


