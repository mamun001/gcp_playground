

echo ______________________________________________________________________________________________________
echo
echo enabling ids API on sandbox
echo
sleep 2
gcloud services enable ids.googleapis.com  --project sandbox
echo
echo

echo 
echo ______________________________________________________________________________________________________
echo
echo show enabled APIS | sort
echo
sleep 2
gcloud services list --project sandbox
echo


exit 0
exit 0
#gcloud services enable cloudapis.googleapis.com cloudkms.googleapis.com container.googleapis.com containerregistry.googleapis.com iam.googleapis.com --project ${PROJECT_ID}
