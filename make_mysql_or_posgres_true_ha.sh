echo
#gcloud config set project nonprod-shared
#gcloud config set project prod-shared 
#gcloud config set project rehersal-universal
#gcloud config set project rehersal


source ./set_p.sh

echo __________________________________________________
echo
echo getting a list
echo
gcloud sql instances list | sort
echo
echo

echo __________________________________________________
echo -n "ENTER ID of sql instance: echo e.g. ms-test3: "
echo
read ID
echo
sleep 2

echo _________________________________________________________________________
echo
echo Finding out if it is already HA or not
echo ZONAL means NOT HA
echo REGIONAL means YES HA
echo
gcloud sql instances describe $ID --format=json | grep -i availabilityType
echo
sleep 5

exit 0



echo __________________________________________________
echo
echo find type:
echo
TYPE=`gcloud sql instances describe $ID --format=json | grep -i databaseversion`

if [[ $TYPE =~ "POSTG" ]]; then
   echo "postgres"
   DBTYPE="POSTGRES"
fi

if [[ $TYPE =~ "MYSQL" ]]; then
   echo "mysql"
   DBTYPE="MYSQL"
fi


echo _______________________________________________________________
echo
sleep 4
REGION=`gcloud sql instances describe $ID --format=json | grep region | cut -d: -f2 | cut -d\" -f2`
echo REGION=$REGION
echo
echo
sleep 2




echo __________________________________________________
echo
#echo making read replica
#echo
#sleep 2
#gcloud sql instances create $REPLICA_NAME --master-instance-name=$ID --region=$REGION
#
#  read replicas are not HA
#
#
#  Making HA for real
if [[ $TYPE =~ "POSTG" ]]; then
   echo "postgres"
   DBTYPE="POSTGRES"
   #gcloud sql instances patch $ID --availability-type REGIONAL
fi

if [[ $TYPE =~ "MYSQL" ]]; then
   echo "mysql"
   DBTYPE="MYSQL"
   # for mysql : backup is daiy in UTC in 24 hour format
   gcloud sql instances patch $ID --availability-type REGIONAL --enable-bin-log --backup-start-time=00:01
fi




echo __________________________________________________
echo
echo describe:
echo
sleep 1
gcloud sql instances describe $ID --format=json  | grep -i replica
echo
echo

echo __________________________________________________
echo
echo getting a list
echo
gcloud sql instances list | sort
echo
echo
