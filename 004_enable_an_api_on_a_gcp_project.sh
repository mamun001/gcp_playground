

#sql-component.googleapis.com 
#cloudapis.googleapis.com


#source ./set_p.sh

#NAME                                 TITLE
#bigquery.googleapis.com              BigQuery API
#bigquerystorage.googleapis.com       BigQuery Storage API
#cloudapis.googleapis.com             Google Cloud APIs
#cloudbuild.googleapis.com            Cloud Build API
#clouddebugger.googleapis.com         Cloud Debugger API
#cloudresourcemanager.googleapis.com  Cloud Resource Manager API
#cloudtrace.googleapis.com            Cloud Trace API
#compute.googleapis.com               Compute Engine API
#container.googleapis.com             Kubernetes Engine API
#containerregistry.googleapis.com     Container Registry API
#datastore.googleapis.com             Cloud Datastore API
#iam.googleapis.com                   Identity and Access Management (IAM) API
#iamcredentials.googleapis.com        IAM Service Account Credentials API
#logging.googleapis.com               Cloud Logging API
#monitoring.googleapis.com            Cloud Monitoring API
#oslogin.googleapis.com               Cloud OS Login API
#pubsub.googleapis.com                Cloud Pub/Sub API
#run.googleapis.com                   Cloud Run Admin API
#servicemanagement.googleapis.com     Service Management API
##serviceusage.googleapis.com          Service Usage API
#sql-component.googleapis.com         Cloud SQL
#storage-api.googleapis.com           Google Cloud Storage JSON API
#storage-component.googleapis.com     Cloud Storage
#storage.googleapis.com               Cloud Storage API


echo 
echo -n "ENTER GCP PROJECT_ID: e.g. youtubedemo-332106: "
read PROJECT_ID
echo
echo PROJECT_ID=$PROJECT_ID
echo
sleep 5

echo ______________________________________________________________________________________________________
echo
echo ENTER API to enable: e.g. sql-component.googleapis.com for CLOUD SQL or cloudapis.googleapis.com or compute.googleapis.com for API in general:
read API_NAME
echo API_NAME=$API_NAME
echo
sleep 3




echo ______________________________________________________________________________________________________
echo
echo enabling
echo
gcloud services enable $API_NAME --project ${PROJECT_ID}
echo
echo


echo ______________________________________________________________________________________________________
echo
echo now lets see the list of enabled APIs for this project
echo
gcloud services list --enabled --project  $PROJECT_ID
echo
echo


