
echo
./set_p.sh
echo


echo ENTER BUCKET_NAME:
read BUCKET_NAME
echo

echo ________________________________________________________________
echo
echo creating bucket
echo
gsutil mb gs://$BUCKET_NAME
echo
sleep 2

echo ________________________________________________________________
echo confirming:
gsutil ls  | grep $BUCKET_NAME
echo
