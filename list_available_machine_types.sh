
source ../set_p.sh
echo



# ZONE="us-west1-c" 
ZONE="us-central1-c" 

# For example
#gcloud compute machine-types list --project=${PROJECT} --filter=zone=${ZONE}
gcloud compute machine-types list --filter=zone=${ZONE} | grep small
