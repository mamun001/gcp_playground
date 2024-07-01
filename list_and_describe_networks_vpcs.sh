
source ./set_p.sh
echo
echo

echo ________________________________________________________________
echo
gcloud compute networks list | sort
echo

echo
echo ENTER NAME
read NAME


echo ________________________________________________________________
echo
gcloud compute networks describe $NAME
echo

