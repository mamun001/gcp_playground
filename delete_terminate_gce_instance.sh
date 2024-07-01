

# long output
#gcloud compute instances list --format=json

source ./set_p.sh
echo
echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo ENTER KW:
read KW
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW
echo


echo
echo ENTER: NAME:
read NAME
gcloud compute instances delete $NAME
