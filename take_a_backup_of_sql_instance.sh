
source set_p.sh

echo _________________________________________________________________________
echo
echo
echo getting a list
echo
gcloud sql instances list | grep NAME
gcloud sql instances list | grep -i POSTG
gcloud sql instances list | grep -i MYSQL
echo
echo

echo _________________________________________________________________________
echo ENTER ID:
echo e.g. ms-test3
echo
read ID
echo
echo ENTER DESCRIPTION_TO_ATTACH_WITH
read DESCR

echo _________________________________________________________________________
echo starting
gcloud sql backups create --instance=$ID --description=DESCR
echo ended
echo
echo _________________________________________________________________________
echo
echo list of backups
echo
gcloud sql backups list --instance=$ID 
echo
