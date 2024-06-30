

#sql-component.googleapis.com 
#cloudapis.googleapis.com


source ./set_p.sh
sleep 5


echo ______________________________________________________________________________________________________
echo
echo these are APIs enabled on this project
echo
gcloud services list 
echo
sleep 7


echo ______________________________________________________________________________________________________
echo
echo ENTER API to disable: e.g. sql-component.googleapis.com for CLOUD SQL or cloudapis.googleapis.com for API in general:
read API_NAME
echo API_NAME=$API_NAME
echo
sleep 5


echo ______________________________________________________________________________________________________
echo 
echo disabling......
echo
gcloud services disable $API_NAME 
#gcloud services disable $API_NAME  --force
echo
echo should be done
sleep 7

echo ______________________________________________________________________________________________________
echo
echo these are APIs enabled on this project NOW AFTER
echo
gcloud services list 
echo
sleep 5


exit 0
exit 0
#gcloud services enable cloudapis.googleapis.com cloudkms.googleapis.com container.googleapis.com containerregistry.googleapis.com iam.googleapis.com --project ${PROJECT_ID}
