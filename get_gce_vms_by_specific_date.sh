

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
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-01T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-02T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-03T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-03T 
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-04T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-05T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-06T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-07T | wc -l


gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-07T
exit 0

gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-08T | wc -l
gcloud compute instances list --format='table(name,zone,status,creationTimestamp)' --sort-by creationTimestamp | grep 2021-09-09T | wc -l
echo
echo
