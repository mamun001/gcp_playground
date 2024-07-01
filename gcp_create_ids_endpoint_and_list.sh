

#  gcloud beta ids endpoints create (ENDPOINT : --zone=ZONE) --network=NETWORK --severity=SEVERITY [optional flags]
#  optional flags may be  --async | --description | --enable-traffic-logs |
#                         --help | --labels | --max-wait | --zone


#worked, takes a long time to show up in list
#gcloud beta ids endpoints create foobar-endpoint --network=default --zone=us-central1-a --project=cf-sandbox --severity=LOW
# alex has a VM here . worked and this time it actually said "CREATING"
# ya, so the lesson is that if the network or zone is bad, then it wont create
#
echo   TAKES 21 Minutes
echo
date
echo
# worked ? NO
# error: The request was invalid: Network parameter is invalid. Make sure the network exists and that Private Service Access is configured.
#gcloud beta ids endpoints create delete-me-mamun-demo --network=soa --zone=us-west1-a --project=cf-production --severity=LOW

#worked
echo
echo LIST PROD
echo
echo started at 13:24
echo
gcloud beta ids endpoints list --project=cf-production
echo
date
echo
# worked format wise. deletion started 
#  
#   DELETE TOOK 8 MINUTES
#
#gcloud beta ids endpoints delete delete-me-mamun-demo --project=cf-production --zone=us-central1-a

#echo
#echo STAGE
#gcloud beta ids endpoints list --project=cf-stage


