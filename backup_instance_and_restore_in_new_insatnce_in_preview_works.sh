#/bin/bash

echo this needs to be tested 
exit 0

#preview is always the destination
DESTZONE=us-central1-a
DESTPW=foo
DESTDISKSIZE=100GB
DESTTIER=db-custom-16-61440


echo
echo ENTER SOURCE_ENV e.g. us eu jp Must be lowercase because this is later used in sql instance name:
read SOURCE_ENV
echo SOURCE_ENV=$SOURCE_ENV
echo
sleep 5

source ./set_p.sh

echo PROJECT=$PROJECT
SOURCEPROJECT=$PROJECT
echo SOURCEPROJECT=$SOURCEPROJECT
echo
sleep 5


echo _______________________________________________________________________
echo
echo List of available SQL Instances
echo
gcloud sql instances list | grep -v NAME | awk '{print $1}' | sort > ./tmp.sql
nl -w2 -s': ' ./tmp.sql  > ./tmp.sql.l
cat ./tmp.sql.l
echo
echo
echo -n "ENTER A LINE NUMBER: "
read NUMBER
echo
SOURCEINSTANCE=`head -$NUMBER ./tmp.sql.l | tail -1 | cut -d: -f2 | cut -c2-99`
echo SOURCEINSTANCE=$SOURCEINSTANCE
sleep 5

echo _________________________________________________________________________
echo Figuring out DATABASE Type:
gcloud sql instances list | grep $SOURCEINSTANCE | awk '{print $2}'
DB_TYPE=`gcloud sql instances list | grep $SOURCEINSTANCE | awk '{print $2}'`
echo DB_TYPE=$DB_TYPE
sleep 5

echo _________________________________________________________________________
echo
echo ENTER A Description for the backup
read DESCR
echo starting backup. takes about 90 seconds.
echo
gcloud sql backups create --instance=$SOURCEINSTANCE --description=$DESCR
echo
echo backup should have ended
echo
sleep 5


echo _________________________________________________________________________
echo
echo Getting BACKUPID
echo
echo making sure our backup shows up in the successful list:
echo
gcloud sql backups list --instance=$SOURCEINSTANCE | grep SUCCESSFUL 
echo
BACKUPID=`gcloud sql backups list --instance=$SOURCEINSTANCE | grep SUCCESSFUL | head -1 | awk '{print $1}'`
echo BACKUPID=$BACKUPID
echo
echo getting description of backup we just did:
echo
gcloud sql backups describe $BACKUPID -i $SOURCEINSTANCE
sleep 5

echo _________________________________________________________________________
DESTINATIONPROJECT=foo-preview
echo project set to $DESTINATIONPROJECT
gcloud config set project $DESTINATIONPROJECT
echo
sleep 5

echo _________________________________________________________________________
echo confirm:
gcloud config list | grep project
echo
sleep 5

echo ____________________________________
echo
NEWINSTANCENAME="${SOURCEINSTANCE}-$SOURCE_ENV-$(date +%F)"
echo NEWINSTANCENAME=$NEWINSTANCENAME
echo
sleep 5
echo creating a SQL instance in preview
echo
sleep 5
#
# ZONE is always us-central1-a for PREVIEW
# example commands:
#gcloud sql instances create ms-org-user-10202020-us --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
#gcloud sql instances create ms-org-user-10202020-eu --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
#gcloud sql instances create ms-org-user-10202020-jp --database-version=POSTGRES_9_6 --zone=us-central1-a --root-password=foo -t=db-custom-16-61440
#gcloud sql instances create $NEWINSTANCENAME --database-version=$DB_TYPE --zone=us-central1-a --root-password=foo -t=db-custom-16-61440 --storage-size=100GB
gcloud sql instances create $NEWINSTANCENAME --database-version=$DB_TYPE --zone=$DESTZONE --root-password=$DESTPW -t=$DESTTIER --storage-size=$DESTDISKSIZE
echo
echo SQL INSTANCE creation DESTINATION i.e. preview should be done
echo
sleep 5

echo _________________________________________________________________________
# Now we have to create the request.json file for the restore
# example
#{
#  "restoreBackupContext":
#  {
#    "backupRunId": "1603237699724",
#    "project": "foo-concert",
#    "instanceId": "org-user"
#  }
#}

#   postgres_restore_template.json

echo _________________________________________________________________________
echo creating request json:
sed -e "s/BACKUPID/${BACKUPID}/g" postgres_restore_template.json | sed -e "s/SOURCEPROJECT/${SOURCEPROJECT}/g" | sed -e "s/SOURCEINSTANCE/${SOURCEINSTANCE}/g" > ./tmp.request.json
echo
echo You should see tmp.request.json file content below: you should see 8 lines including backupRunId and project and instanceId
cat ./tmp.request.json
echo
sleep 5

echo _________________________________________________________________________
########  NOW SEND Restore Request  #########
# examples
#US
#curl -X GET -H "Authorization: Bearer "$(gcloud auth print-access-token) https://www.googleapis.com/sql/v1beta4/projects/foo-concert/instances/org-user/backupRuns
#EU
#curl -X GET -H "Authorization: Bearer "$(gcloud auth print-access-token) https://www.googleapis.com/sql/v1beta4/projects/arc-eu-primary-cluster/instances/org-user/backupRuns

echo _________________________________________________________________________
echo
echo starting restore
echo
sleep 5


echo _________________________________________________________________________
# Actual Restore
curl -X POST \
-H "Authorization: Bearer "$(gcloud auth print-access-token) \
-H "Content-Type: application/json; charset=utf-8" \
-d @tmp.request.json \
https://www.googleapis.com/sql/v1beta4/projects/$DESTINATIONPROJECT/instances/$NEWINSTANCENAME/restoreBackup

echo
echo restore should be in PENDING STATE
echo
echo


# cleanup
rm ./tmp.sl ./tmp.sql.l

