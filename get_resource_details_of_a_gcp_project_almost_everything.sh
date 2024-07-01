#/bin/bash 

if [ $# -lt 2 ]
  then
    echo
    echo "Usage get_resource_details_of_a_gcp_project.sh project_name org_id"
    echo
fi


PROJECT=$1
echo PROJECT=$PROJECT
echo

echo "##########################################################################################"
gcloud config set project $PROJECT
echo
echo


echo "##########################################################################################"
echo 
echo CURRENT PROJECT
echo
gcloud config list  >out 2>&1
grep ^project out 
echo


echo "##########################################################################################"
echo
echo finding parent folder
sleep 1
PARENTID=`gcloud projects describe nonprod-shared  | grep id: | cut -c 8-19`
echo PARENTID=$PARENTID
echo
gcloud alpha resource-manager folders list --organization $2  | grep $PARENTID
echo
sleep 1



echo "##########################################################################################"
echo VPCs
echo
sleep 1
gcloud compute networks list 
echo
sleep 1



echo "##########################################################################################"
echo Eanbled API list
echo
sleep 1
gcloud services list
echo
sleep 1

echo "##########################################################################################"
echo buckets
echo
sleep 1
gsutil ls 
echo
sleep 1
echo -n "Bucket Count: "
gsutil ls  | wc -l
echo
sleep 1

echo "##########################################################################################"
echo pubsub topics list
echo
sleep 1
gcloud pubsub topics list | grep name:
echo
sleep 1
echo -n "Topic Count: "
gcloud pubsub topics list | grep name: | wc -l
echo
sleep 1


echo "##########################################################################################"
echo service account list
echo
sleep 1
gcloud iam service-accounts list  | grep -v NAME | sort
echo
sleep 1
echo -n "Service Account Count: "
gcloud iam service-accounts list  | grep -v NAME | wc -l
echo
sleep 1

echo "##########################################################################################"
echo GKE Cluster list
echo
sleep 1
gcloud container clusters list
echo
sleep 1

echo "##########################################################################################"
echo sql instance list
echo
sleep 1
gcloud sql instances list
echo
sleep 1



