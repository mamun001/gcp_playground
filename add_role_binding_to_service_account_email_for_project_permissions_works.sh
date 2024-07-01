

source ./set_p.sh
echo
echo PROJECT=$PROJECT



echo ____________________________________________________________________________________
echo
echo First lets get a list of SAs in this project:
echo
gcloud iam service-accounts list | sort
echo
sleep 7


echo ___________________________________________________________________________________
echo 
echo -n "ENTER SA EMAIL e.g. mrashid-ansible-test@cf-sandbox.iam.gserviceaccount.com:: "
read SA_EMAIL
SA="serviceAccount:$SA_EMAIL"
echo
echo SA=$SA
echo
sleep 7

echo _________________________________________________________________________
echo
echo roles this SA has before this script:
echo
gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  | grep : | egrep "role|$SA" | grep -A1 "$SA" | grep : | grep -v "$SA"
#gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  
echo
sleep 5


# For what we do, GKE access is enough, but if you need more, you can add more
#echo  "roles/container.admin" > ./tmp.roles
echo "roles/bigquery.admin" > ./tmp.roles
#echo "roles/cloudkms.admin" >> ./.tmp.roles
#echo "roles/cloudsecurityscanner.editor" >> ./tmp.roles
#echo "roles/cloudsql.admin" >> ./tmp.roles
#echo  "roles/compute.admin" >> ./tmp.roles
#echo  "roles/editor" >> ./tmp.roles
#echo  "roles/iam.securityAdmin" >> ./tmp.roles
#echo  "roles/logging.admin" >> ./tmp.roles
#echo  "roles/pubsub.admin" >> ./tmp.roles
#echo  "roles/securitycenter.admin" >> ./tmp.roles
#echo  "roles/storage.admin" >> ./tmp.roles

echo ___________________________________________________________________________________
echo "Roles to be added"
echo
cat ./tmp.roles
echo
sleep 5



echo ___________________________________________________________________________________
#gcloud projects add-iam-policy-binding PROJECT_ID --member=MEMBER --role=ROLE
#gcloud projects add-iam-policy-binding test-7-481ef3d2 --member='serviceAccount:project-factory-20325@terraform-admin-prj.iam.gserviceaccount.com' --role='roles/containeranalysis.admin'

while read r; do
  echo _______________________
  echo "adding role: $r"
  gcloud projects add-iam-policy-binding $PROJECT --member=$SA --role=$r
  echo _______________________
  echo sleep 7
  sleep 7
done <./tmp.roles

echo ___________________________________________________________________________________
echo
echo roles this SA has AFTER this script:
echo
gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  | grep : | egrep "role|$SA" | grep -A1 "$SA" | grep : | grep -v "$SA"
echo





