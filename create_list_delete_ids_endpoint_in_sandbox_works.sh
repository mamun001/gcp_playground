

#  gcloud beta ids endpoints create (ENDPOINT : --zone=ZONE) --network=NETWORK --severity=SEVERITY [optional flags]
#  optional flags may be  --async | --description | --enable-traffic-logs |
#                         --help | --labels | --max-wait | --zone


#worked, takes a long time to show up in list
#gcloud beta ids endpoints create foobar-endpoint --network=default --zone=us-central1-a --project=cf-sandbox --severity=LOW
# alex has a VM here . worked and this time it actually said "CREATING"
# ya, so the lesson is that if the network or zone is bad, then it wont create
#
#   TAKES 21 Minutes
# worked
#gcloud beta ids endpoints create foobar2-endpoint --network=sandbox --zone=us-west1-b --project=cf-sandbox --severity=LOW
#gcloud beta ids endpoints create foobar3-endpoint --network=foo-network-instance --zone=us-central1-a --project=cf-sandbox --severity=LOW
# after enabling google private in one subnet
#gcloud beta ids endpoints create foobar4-endpoint --network=foo-network-instance --zone=us-central1-a --project=cf-sandbox --severity=LOW

#worked
echo
echo LIST SANDBOX
echo
echo
gcloud beta ids endpoints list --project=cf-sandbox
echo
date
echo
# worked format wise. deletion started 
#  
#   DELETE TOOK 8 MINUTES
#
#gcloud beta ids endpoints delete foobar2-endpoint --project=cf-sandbox --zone=us-west1-b

#echo
#echo STAGE
#gcloud beta ids endpoints list --project=cf-stage


