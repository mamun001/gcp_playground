echo
echo

source ./set_p.sh


echo
echo __________________________________________________________
echo 
echo CURRENT PROJECT
echo
gcloud config list | grep project
gcloud config list | grep project
gcloud config list | grep project
echo


echo _____________________________________________________
echo
echo finding parent folder
sleep 1
PARENTID=`gcloud projects describe nonprod-shared  | grep id: | cut -c 8-19`
echo PARENTID=$PARENTID
echo
gcloud alpha resource-manager folders list --organization 264719799359  | grep $PARENTID
echo
sleep 7



echo __________________________________________________________
echo VPCs
echo
sleep 1
gcloud compute networks list 
echo
sleep 7



echo __________________________________________________________
echo Eanbled API list
echo
sleep 7
gcloud services list
echo
sleep 7

echo __________________________________________________________
echo buckets
echo
sleep 1
gsutil ls 
echo
sleep 1
gsutil ls  | wc -l
echo
sleep 7

echo __________________________________________________________
echo pubsub topics list
echo
sleep 1
gcloud pubsub topics list | grep name:
echo
sleep 1
gcloud pubsub topics list | grep name: | wc -l
echo
sleep 7


echo __________________________________________________________
echo service account list
echo
sleep 1
gcloud iam service-accounts list  | grep -v NAME | sort
echo
sleep 1
gcloud iam service-accounts list  | grep -v NAME | wc -l
echo
sleep 7

echo __________________________________________________________
echo GKE Cluster list
echo
sleep 1
gcloud container clusters list
echo
sleep 7

echo __________________________________________________________
echo sql instance list
echo
sleep 1
gcloud sql instances list
echo
sleep 7



