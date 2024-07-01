#/bin/bash


echo
echo This scripts basiclaly sets up a tunnel to the DB at 127.0.0.1 on port whatever
echo "  After tunnel is set up you run psql command to GO TO the DB and run SQL commands"
echo
sleep 2

echo
echo After this connects use psql script here to actually connect to DB and do stuff:
echo
sleep 2

SA_JSON_FILE="/Users/mamun001/foo-preview-9589392889d7-sa-mamun-terraform.json"
echo SA_JSON_FILE=$SA_JSON_FILE
echo
sleep 2


source ./set_p.sh
# That will print PROJECT

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
INSTANCE=`head -$NUMBER ./tmp.sql.l | tail -1 | cut -d: -f2 | cut -c2-99`
echo INSTANCE=$INSTANCE
sleep 2


echo
# port 5432 for postgres
PORT=5432
echo PORT=$PORT
echo
sleep 2

echo
# region is us-central1 for preview. This will change for other projects
REGION=us-central1
echo REGION=$REGION
echo
sleep 2


echo ___________________________________________________________________________________
echo setting up tunnel
echo
cloud_sql_proxy -credential_file=$SA_JSON_FILE  -instances=$PROJECT:$REGION:$INSTANCE=tcp:$PORT &
echo
sleep 3

echo ___________________________________________________________________________________
echo
echo Go to console and change password for foo before going to next step:
echo ENTER when done:
read NOTHING
echo
echo starting psql
echo
psql "dbname=msorguser host=127.0.0.1 port=5432 user=foo"



exit 0
#worked
#./cloud_sql_proxy -credential_file=/Users/mamun001/foo-preview-9589392889d7-sa-mamun-terraform.json  -instances=foo-preview:us-central1:org-user-10212020-us=tcp:5432

./cloud_sql_proxy -credential_file=/Users/mamun001/foo-preview-9589392889d7-sa-mamun-terraform.json  -instances=foo-preview:us-central1:org-user-10212020-eu=tcp:5432



