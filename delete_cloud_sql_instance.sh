#/bin/bash

source ./set_p.sh


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
INSTANCE_TO_DELETE=`head -$NUMBER ./tmp.sql.l | tail -1 | cut -d: -f2 | cut -c2-99`
echo INSTANCE_TO_DELETE=$INSTANCE_TO_DELETE
sleep 5



echo ______________________________________________________________________________________________________
echo deleting 
gcloud sql instances delete  $INSTANCE_TO_DELETE


rm ./tmp.sql ./tmp.sql.l
exit 0
