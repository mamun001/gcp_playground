
echo "CHOOSE A PROJECT"
echo
echo "21. youtubedemo :: personal account "
echo


echo -n "ENTER NUMBER: "
read LINE
if [ "$LINE" = "21" ]; then
   PROJECT="youtube_project_id"
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


