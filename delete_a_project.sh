

echo _______________________________________________________________________________
echo confirming: whoami
echo
gcloud config list account --format "value(core.account)"
echo
sleep 5



echo ______________________________________________________________________________________________________
echo
echo projects list:
echo
gcloud projects list | sort  | grep -v sys
echo
sleep 2


echo ___________________________________
echo
echo ENTER PROJET TO DELETE:
read PROJECT_TO_DELETE
echo



echo _______________________________________________________________________________
echo
echo PROJECT_TO_DELETE=$PROJECT_TO_DELETE 
echo PROJECT_TO_DELETE=$PROJECT_TO_DELETE 
echo PROJECT_TO_DELETE=$PROJECT_TO_DELETE 
echo PROJECT_TO_DELETE=$PROJECT_TO_DELETE 
echo PROJECT_TO_DELETE=$PROJECT_TO_DELETE 
echo
echo sleeping 20 seconds to start the the delete
sleep 20

echo
echo deleting project $PROJECT_TO_DELETE
sleep 5
echo
gcloud alpha projects delete $PROJECT_TO_DELETE
echo
echo

exit 0
exit 0

