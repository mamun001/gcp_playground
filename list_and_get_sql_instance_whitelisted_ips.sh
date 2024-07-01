
source ./set_p.sh

echo
echo getting a list
echo
gcloud sql instances list
echo
echo

echo ENTER ID:
#echo e.g. ms-test3
echo
read ID
echo
sleep 2

echo ____________________________________________________________________________________________________________
#gcloud sql instances describe $ID --format=json  | jq '.settings.ipConfiguration' > ./save.orguser-eu.whitelist.with.names
echo
echo current list of whitelisted IPs
echo
CURRENT_WHITE_LIST=`gcloud sql instances describe $ID --format=json  | jq '.settings.ipConfiguration' | grep value | cut -d: -f2 | cut -d\" -f2 | paste -sd "," -`
echo $CURRENT_WHITE_LIST
echo
sleep 2

echo ____________________________________________________________________________________________________________



