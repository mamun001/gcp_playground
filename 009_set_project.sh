
echo "CHOOSE A PROJECT"
echo
echo "1. youtubedemo :: personal account "
echo


echo -n "ENTER NUMBER: "
read LINE
if [ "$LINE" = "1" ]; then
   PROJECT="youtube-demo-3-367300"
fi


#
# _________________________________________________
gcloud config set project $PROJECT
export PROJECT=$PROJECT
#
# _________________________________________________
gcloud config set project $PROJECT
export PROJECT=$PROJECT
echo var PROJECT=$PROJECT
echo _________________________________________________________________________
echo CONFIRMING:
gcloud config list | grep project
echo _________________________________________________________________________
echo
sleep 2


