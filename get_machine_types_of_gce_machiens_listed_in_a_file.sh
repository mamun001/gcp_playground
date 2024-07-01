


FILE_GCE=tmp.instances.stg37

source ./set_p.sh
echo
echo
echo _____________________________________________________________________________
echo list of GCE instances:
cat $FILE_GCE
#read KW
#gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW | cut -c1-68 | sort
echo
sleep 5

echo ___________________________________________________________
echo
echo setting zone to us-west1-a
echo
gcloud config set compute/zone us-west1-a
sleep 5


echo ______________________________________________________________________
while read i; do
  gcloud compute instances describe $i --zone us-west1-a --format='table(machineType)' | cut -d/ -f11 | grep -v TYPE
done <./$FILE_GCE



