
#source ./set_p.sh
echo

#gcloud compute addresses list --project  $p
#gcloud compute addresses list 
#gcloud compute addresses list  | grep 165

echo
echo THIS SCRIPT ONLY FINDS EXTERNAL STATIC IPS for GCE VMS
echo NOT LBs
echo There is different working script for that
echo
echo
sleep 5



echo
echo -n "Enter part of IP: e.g. 165: "
read IP_PART
echo IP_PART=$IP_PART
echo
echo
echo
sleep 3


PROJECT="sandbox"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="foo"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2

PROJECT="production"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="stage"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="sandbox"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="development"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="businessintelligence"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="infrastructure"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="prj-bi-d-platform-data-d49d"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2


PROJECT="prj-bi-p-platform-data-751a"
echo PROJECT=$PROJECT
gcloud compute addresses list  --project $PROJECT | grep $IP_PART | grep EXTERNAL
echo
sleep 2



