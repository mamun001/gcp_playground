


#FILE_GCE=tmp.instances.stg37
FILE_GCE=elk_staging_vms


echo _____________________________________________________________________________
echo
echo VMs to shutdown
echo
cat elk_staging_vms
echo
sleep 7



echo ___________________________________________________________
source ./set_p.sh
echo
echo

echo ___________________________________________________________
echo
echo setting zone to us-west1-a
echo
gcloud config set compute/zone us-west1-a
sleep 5


#echo _____________________________________________________________________________
#echo list of GCE instances:
cat $FILE_GCE
#read KW
#gcloud compute instances list --format='table(name,zone,status,tags.list())' | grep $KW | cut -c1-68 | sort
#echo
#sleep 5


echo ______________________________________________________________________
while read i; do
  echo ________________________________________________________
  echo STOPPING "$i"
  echo
  sleep 3
  gcloud compute instances stop $i
  echo sleeping 30
  sleep 30
done <./$FILE_GCE



