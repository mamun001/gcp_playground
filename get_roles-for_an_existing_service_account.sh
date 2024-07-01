

source ./set_p.sh

#SA=serviceAccount:delete-me-mamun@prj-bi-d-platform-data-d49d.iam.gserviceaccount.com
#SA=serviceAccount:org-terraform@cft-seed-5300.iam.gserviceaccount.com
#SA=serviceAccount:793150362165@cloudbuild.gserviceaccount.com
#SA="serviceAccount:$SA_EMAIL"
#SA="mrashid-ansible-test@cf-sandbox.iam.gserviceaccount.com"  (in cf-sandbox)

echo
echo PROJECT=$PROJECT
echo
sleep 3
echo ___________________________________________________________________________________
echo 
echo -n "ENTER SA EMAIL e.g. org-terraform@cft-seed-5300.iam.gserviceaccount.com "
echo
read SA_EMAIL

echo
echo SA=$SA
echo
sleep 7

echo _________________________________________________________________________
echo
echo roles this SA has before this script:
echo
gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  | grep : | egrep "role|$SA" | grep -A1 "$SA" | grep : | grep -v "$SA"
echo
sleep 5

exit 0


echo "roles/bigquery.admin" > ./tmp.roles
echo "roles/cloudkms.admin" >> ./.tmp.roles
echo "roles/cloudsecurityscanner.editor" >> ./tmp.roles
echo "roles/cloudsql.admin" >> ./tmp.roles
echo  "roles/compute.admin" >> ./tmp.roles
echo  "roles/container.admin" >> ./tmp.roles
echo  "roles/editor" >> ./tmp.roles
echo  "roles/iam.securityAdmin" >> ./tmp.roles
echo  "roles/logging.admin" >> ./tmp.roles
echo  "roles/pubsub.admin" >> ./tmp.roles
echo  "roles/securitycenter.admin" >> ./tmp.roles
echo  "roles/storage.admin" >> ./tmp.roles

exit 0

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
  echo "adding role: $r"
  gcloud projects add-iam-policy-binding $PROJECT --member=$SA --role=$r
  sleep 7
done <./tmp.roles

echo ___________________________________________________________________________________
echo
echo roles this SA has AFTER this script:
echo
gcloud projects get-iam-policy $PROJECT --format='json(bindings)'  | grep : | egrep "role|$SA" | grep -A1 "$SA" | grep : | grep -v "$SA"
echo





