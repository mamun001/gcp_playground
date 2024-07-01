
source ./set_p.sh
source ./set_c.sh

echo _________________________________________________________
echo
echo LIST OF CLUSTERS
echo
gcloud container clusters list
echo
sleep 2


echo
echo ENTER CLUSTER:
read CLUSTER
echo

echo
echo ENTER REGION:
read REGION
echo


echo _________________________________________________________
echo
echo LIST OF NODEPOOLS:
echo
gcloud container node-pools list --cluster $CLUSTER --region $REGION
echo
echo

echo _________________________________________________________
echo
echo ENTER TO_DELETE__NODEPOOL_NAME:
read NAME
echo



echo _________________________________________________________
echo
echo deleting node pool $NAME:
echo
sleep 3
gcloud container node-pools delete $NAME --cluster $CLUSTER --region $REGION
echo
echo _________________________________________________________


