
source ./set_p.sh

echo Number of Roles:
echo
gcloud iam roles list | grep name | sort | wc -l
echo
echo
gcloud iam roles list | grep name | grep container


