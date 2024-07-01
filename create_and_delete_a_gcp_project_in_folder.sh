


# This needs to be tested 

exit 0



echo _______________________________________________________________________________
echo
echo factory account is the only one that has access to uncategorized folder
echo
echo so logging in as terraform-factory
gcloud auth activate-service-account --key-file=/Users/johndoe/factory.json
echo
sleep 5

echo _______________________________________________________________________________
echo confirming: whoami
echo
gcloud config list account --format "value(core.account)"
echo
sleep 5

echo _______________________________________________________________________________
echo
echo creating project
echo
gcloud alpha projects create delete-me-foobar2 --folder 550557746592
echo
echo
sleep 2


echo _______________________________________________________________________________
echo
echo deleting project
echo
gcloud alpha projects delete delete-me-foobar2 
echo
echo

exit 0
exit 0



# 881330147263 = development folder
gcloud alpha projects create delete-me-foobar2 --folder 881330147263

exit 0
gcloud alpha projects create [PROJECT_ID] --folder [FOLDER_ID]
