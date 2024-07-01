
echo
source ./set_p.sh
echo
echo
echo _____________________________________________________________________________
echo list of ALL GCE instances:
echo Count:
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep RUNNING  | wc -l
sleep 3
echo
echo List:
echo
sleep 2
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep RUNNING  | sort | cut -c1-140
echo


echo
echo ENTER KW:
read KW
#gcloud compute instances list --format='table(name,zone,status,tags.list())' 
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW | grep RUNNING | cut -c1-150
echo


echo
echo ENTER: NAME:
read NAME
echo

echo ENTER: ZONE: e.g. us-central1-a europe-west1-b:
read ZONE
echo

echo
echo Starting ssh
echo
sleep 2
#gcloud beta compute ssh virtualgatewaytest1 --zone=us-central1-a --project=test-7-481ef3d2
#gcloud beta compute ssh $NAME --zone=europe-west1-b --project=$PROJECT
gcloud beta compute ssh $NAME --zone=$ZONE --project=$PROJECT
