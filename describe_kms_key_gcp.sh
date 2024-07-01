
source set_p.sh
echo


echo
echo LIST:
echo
gcloud kms keyrings list --location=global
echo

echo
echo -n "ENTER KEYRING: (Just the last word): "
read KR
echo

echo
gcloud kms keys list  --location=global --keyring $KR
echo


echo 
echo -n "ENTER KEY: (Just the last word): "
read KEY
echo
echo KEY=$KEY
echo

echo
#gcloud kms keys describe vault-init --location=global --keyring vault
gcloud kms keys describe $KEY --location=global --keyring $KR

