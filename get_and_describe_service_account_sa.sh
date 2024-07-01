

source ./set_p.sh
echo


echo
echo __________________________________________________
echo
gcloud iam service-accounts list | sort
echo
sleep 2

echo
echo __________________________________________________
echo
echo -n "Enter SA EMAIL to describe: "
read SA
echo
gcloud iam service-accounts describe $SA
echo


