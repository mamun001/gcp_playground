

source ./set_p.sh


echo
echo __________________________________________________
echo
gcloud iam service-accounts list | sort
echo
sleep 2

echo
echo __________________________________________________
echo
echo -n "Enter SA EMAIL to delete: "
read SA
echo
#SA=delete-me-rashid
echo Deleting service account $SA
echo
sleep 7
gcloud iam service-accounts delete $SA
echo
