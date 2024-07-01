echo
#gcloud config set project arc-eu-primary-cluster
#gcloud config set project foo-preview
#gcloud config set project sre-sandbox-243618
#gcloud config set project foo-concert 
#gcloud config set project nonprod-shared
#gcloud config set project foo-prod-shared 
#gcloud config set project foo-rehersal-universal
#gcloud config set project foo-rehersal

while read p; do
  echo _______________________________________________________________________
  echo "$p"
  gcloud config set project $p
  gcloud config list | grep project
  gcloud sql instances list | wc -l
done <list_of_all_projects

exit 0


gcloud config list | grep project
echo
sleep 2

echo
echo getting a list
echo
gcloud sql instances list
echo
echo

echo ENTER ID:
echo e.g. ms-test3
echo
read ID
echo
sleep 2

gcloud sql instances describe $ID --format=json 

