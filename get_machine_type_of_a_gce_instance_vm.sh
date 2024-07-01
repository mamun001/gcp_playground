
# long output
#gcloud compute instances list --format=json

source ./set_p.sh
echo


echo
echo _____________________________________________________________________________
echo list of GCE instances:
echo
#gcloud compute instances list --format='table(name,status,tags.list())' --zones=us-west1-a
#gcloud compute instances list --format='table(name,status,tags.list())' 


echo
echo COUNT:
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())'   | sort | wc -l
echo
echo
sleep 7
echo
echo -n KEYWORD TO SEARCH FOR: 
read KW
echo
gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $KW | cut -c1-68
echo
echo
sleep 7

#echo
#echo printing all VMs
#echo
#gcloud compute instances list --format='table(name,zone,status,tags.list())'   | sort 
#echo


# choose

echo
echo -n "ENTER INSTANCE NAME to describe: "
read INS_NAME


#find zone
ZONE=`gcloud compute instances list --format='table(name,zone,status,tags.list())'   | grep $INS_NAME | awk '{print $2}'`
echo zone for this instance = $ZONE


# describe
echo
echo
#works fine
#gcloud compute instances describe $INS_NAME --zone $ZONE 
gcloud compute instances describe $INS_NAME --zone $ZONE --format='table(machineType)'
echo

