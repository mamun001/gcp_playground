

source ./set_p.sh

echo _______________________________________________________________________________________________________________________
echo
echo VM COUNT:
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' | wc -l
echo
sleep 4

echo _______________________________________________________________________________________________________________________
echo
echo Sorted by Creation Time
echo
sleep 2
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp
echo
echo
