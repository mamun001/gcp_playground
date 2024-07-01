
echo ____________________________________________________________________________________________
echo common projects:
echo
echo nonprod-shared
echo sre-sandbox-2
echo test-7-481ef3d2
echo vault-training-mamun
echo

echo -n "ENTER PROJECT: "
read PROJECT
gcloud config set project $PROJECT
echo

echo _________________________________________________________________________
gcloud config list | grep project
gcloud config list | grep project
gcloud config list | grep project
echo _________________________________________________________________________
echo
sleep 2




echo _________________________________________________________________________
#CLUSTER=db-arango-sfo
#NODEPOOL=arangodb-pool
#REGION=us-west1-c
#NUMBER=9

CLUSTER=vault
NODEPOOL=default-pool
REGION=us-west1-c
NUMBER=5


#gcloud container clusters resize db-arango-sfo --node-pool arangodb-pool  --num-nodes num-nodes
gcloud container clusters resize $CLUSTER --node-pool $NODEPOOL  --num-nodes $NUMBER --region $REGION


