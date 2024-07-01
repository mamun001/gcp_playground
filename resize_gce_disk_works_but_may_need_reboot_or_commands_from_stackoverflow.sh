
source ./set_p.sh
echo

echo DISKS:
echo
sleep 1
gcloud compute disks list | sort
echo
sleep 5


echo 
echo ENTER PART OF DISK NAME:
read PART
echo
gcloud compute disks list | grep $PART | sort
echo
sleep 5


echo 
echo ENTER DISK_NAME:
read DISK_NAME
echo

echo 
echo ENTER NEW_SIZE
read NEW_SIZE
echo


#echo
#echo ENTER REGION
#read REGION
#echo
#sleep 5

echo
echo ENTER ZONE
read ZONE
echo
sleep 5


#gcloud compute disks resize example-disk --size 250    
echo 
echo resizing in 9 second
echo
sleep 11
gcloud compute disks resize $DISK_NAME --size $NEW_SIZE --zone $ZONE
echo


echo POST:
gcloud compute disks list | grep $DISK_NAME
echo
