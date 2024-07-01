VM_NAME=virtualgatewaypreview2
ZONE=us-central1-a
PROJECT=test-7-481ef3d2

#gcloud beta compute ssh virtualgatewaypreview1 --zone=us-central1-a --project=preview
gcloud beta compute ssh $VM_NAME --zone=$ZONE --project=$PROJECT <<'ENDSSH'
hostname
uptime
ENDSSH
