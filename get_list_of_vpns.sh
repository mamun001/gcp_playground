
# works


echo ___________________________________________________________________________________________
echo
echo production has 10 VPN Tunnels
echo stage has 2
echo
echo you can see traffic under monitoring tab in GCP console
echo default VPN in prod has good amount of traffic
echo
echo sleeping 5
sleep 5

echo ___________________________________________________________________________________________
echo LEGACY
PROJECT=production
echo PROJECT=$PROJECT
#gcloud compute routes list --project=$PROJECT | grep peering
gcloud compute vpn-tunnels list --project=$PROJECT
sleep 5

echo ___________________________________________________________________________________________
echo CF non-legacy
PROJECT=production
echo PROJECT=$PROJECT
#gcloud compute routes list --project=$PROJECT | grep peering
gcloud compute vpn-tunnels list --project=$PROJECT
sleep 5

echo ___________________________________________________________________________________________
echo STAGE
PROJECT=stage
echo PROJECT=$PROJECT
#gcloud compute routes list --project=$PROJECT | grep peering
gcloud compute vpn-tunnels list --project=$PROJECT
sleep 5

