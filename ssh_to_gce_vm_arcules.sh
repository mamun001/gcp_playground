
source set_p.sh
echo

echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())' | sort
echo
echo
sleep 5



echo _____________________________________________________________________________
echo ENTER KW:
read KW
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW
echo


echo
echo ENTER: NAME:
read NAME
echo

echo ENTER: ZONE: e.g. us-central1-a europe-west1-b:
read ZONE
echo

#gcloud beta compute ssh virtualgatewaytest1 --zone=us-central1-a --project=test-7-481ef3d2
#gcloud beta compute ssh $NAME --zone=europe-west1-b --project=$PROJECT
gcloud beta compute ssh $NAME --zone=$ZONE --project=$PROJECT
