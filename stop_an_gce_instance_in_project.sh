

# long output
#gcloud compute instances list --format=json

source ./set_p.sh
echo
echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo ENTER KW:
read KW
gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW | cut -c1-70 | sort
echo

echo ___________________________________________________________
echo
echo setting zone to us-west1-a
echo
gcloud config set compute/zone us-west1-a
sleep 5

echo ___________________________________________________________
echo
echo ENTER: INSTANCE NAME:
read NAME
gcloud compute instances start $NAME
echo
