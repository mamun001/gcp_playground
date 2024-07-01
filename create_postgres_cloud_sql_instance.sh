
source ./set_p.sh
sleep 5

echo ____________________________________
echo creating postgres cloud sql instance
echo
sleep 3
#gcloud sql instances create ms-org-user-10202020-us --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
#gcloud sql instances create ms-org-user-10202020-eu --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
#gcloud sql instances create ms-org-user-10202020-jp --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
gcloud sql instances create foobar --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
echo
