

echo 
echo ENTER INSTANCE
read INSTANCE
echo $INSTANCE
echo

echo 
echo ENTER USER
read USER
echo $USER
echo




sleep 4

echo creating user:
echo
gcloud sql users create $USER -i $INSTANCE --password=foo

