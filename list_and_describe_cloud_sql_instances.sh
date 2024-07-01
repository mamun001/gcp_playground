echo
#gcloud config set project arc-eu-primary-cluster
#gcloud config set project foo-preview
#gcloud config set project sre-sandbox-243618
#gcloud config set project foo-concert 
#gcloud config set project nonprod-shared
#gcloud config set project foo-prod-shared 
#gcloud config set project foo-rehersal-universal
#gcloud config set project foo-rehersal


source ./set_p.sh

echo __________________________________________________
echo
echo getting a list
echo
gcloud sql instances list | sort
echo
echo

echo __________________________________________________
echo -n "ENTER ID of sql instance: echo e.g. ms-test3: "
echo
read ID
echo
sleep 2

gcloud sql instances describe $ID --format=json 

