

echo ___________________________________________________________________________________________
echo
echo prod has 10
echo prodz only 3
echo
echo sleeping 5
sleep 5


echo ___________________________________________________________________________________________
echo LEGACY
PROJECT=production
echo PROJECT=$PROJECT
gcloud compute routes list --project=$PROJECT | grep peering
sleep 5

echo ___________________________________________________________________________________________
PROJECT=production
echo CF NON-LEGACY
echo PROJECT=$PROJECT
gcloud compute routes list --project=$PROJECT | grep peering
