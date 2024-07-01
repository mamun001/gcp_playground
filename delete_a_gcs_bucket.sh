
source ./set_p.sh
echo


echo
echo list:
echo
gsutil ls 
echo

echo -n "ENTER BUCKET URL TO DELETE: e.g. gs://foobar/: "
read BUCKET
echo
echo

echo deleting....
echo
gsutil rm -r $BUCKET
echo
echo


exit 0


gsutil rm -r gs://foo-prod-jp-arcus-user-profile-images/
sleep 5
gsutil rm -r gs://foo-prod-jp-axis-tenant/
sleep 5
gsutil rm -r gs://foo-prod-jp-clients-data/
sleep 5
gsutil rm -r gs://foo-prod-jp-device-proxy/
sleep 5
gsutil rm -r gs://foo-prod-jp-diagnostic-data/
sleep 5
gsutil rm -r gs://foo-prod-jp-internal-sa-provisioning/
sleep 5
gsutil rm -r gs://foo-prod-jp-language-portal/
sleep 5
gsutil rm -r gs://foo-prod-jp-partner-terms/
sleep 5
gsutil rm -r gs://foo-prod-jp-production-iot-device-drivers/
sleep 5
gsutil rm -r gs://foo-prod-jp-provisioning-keys/
sleep 5
gsutil rm -r gs://foo-prod-jp-tenant-service-accounts/
sleep 5

echo
echo list again of jp:
echo
gsutil ls | grep jp
exit 0
gsutil rm -r gs://foo-bucket
