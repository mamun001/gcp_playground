

source ~/set_p.sh
echo
echo PROJECT=$PROJECT
echo

echo 
echo list of Service Accounts in this project
echo
sleep 3
gcloud iam service-accounts list | sort | awk '{print $1}'
echo
echo
sleep 2

#
#  exampple SA from concert project
#

echo 
echo ENTER Service Account Name: e.g. mamun-sa-terraform:
read SA
echo
echo
gcloud projects get-iam-policy $PROJECT  --flatten="bindings[].members" --format='table(bindings.role)' --filter="bindings.members:$SA"
echo
echo


exit 0

#works
#gcloud projects get-iam-policy sre-sandbox-243618  --flatten="bindings[].members" --format='table(bindings.role)' --filter="bindings.members:mamun-foobar"


#gcloud projects get-iam-policy <YOUR GCLOUD PROJECT>  \ --flatten="bindings[].members" \ --format='table(bindings.role)' \ --filter="bindings.members:<YOUR SERVICE ACCOUNT>"


# returns empty. i think it can't be a SA
gcloud projects get-iam-policy foo-project --flatten="bindings[].members" --format='table(bindings.role)' --filter="bindings.members:mamun-sa-terraform"
