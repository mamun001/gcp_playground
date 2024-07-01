
echo
echo getting a list
echo
gcloud sql instances list
echo
echo

echo ENTER ID:
echo e.g. ms-test3
echo
read ID
#ID=orguser-eu
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


if [[ $CURRENT_WHITE_LIST == *"35.239.22.173"* ]]; then
  echo "The vault externals IPs are already in the white list. Nothing to do. exiting"
  exit 0
else
  echo "The vault externals IPs are not in the white list. Going Forward"
fi
echo
sleep 2



echo ____________________________________________________________________________________________________________
echo
echo generating generating a new list
echo
TO_ADD="1.1.1.1/32"
NEW_WHITE_LIST="$CURRENT_WHITE_LIST,$TO_ADD"
echo $NEW_WHITE_LIST


echo ____________________________________________________________________________________________________________
echo
echo adding a new ip to the list:
echo
gcloud sql instances patch $ID --authorized-networks $NEW_WHITE_LIST
echo
sleep 1


echo ____________________________________________________________________________________________________________
echo
echo UPDATED list of whitelisted IPs
echo
UPDATED_WHITE_LIST=`gcloud sql instances describe $ID --format=json  | jq '.settings.ipConfiguration' | grep value | cut -d: -f2 | cut -d\" -f2 | paste -sd "," -`
echo $UPDATED_WHITE_LIST
echo


exit 0

gcloud sql instances describe $ID --format=json  | jq '.settings.ipConfiguration.authorizedNetworks' | grep value | cut -d: -f2 | cut -d\" -f2 | paste -sd "," -

