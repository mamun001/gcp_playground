

echo ____________________________________________________________________________________________
echo common projects:
echo
echo arc-eu-primary-cluster
echo foo-concert 
echo foo-preview
echo foo-rehersal
echo foo-prod-shared 
echo foo-rehersal-universal 
echo foo-prod-jp-fde95641
echo nonprod-shared
echo sre-sandbox-243618
echo test-7-481ef3d2
echo vault-training-mamun
echo





echo _______________________________________________
echo
echo -n "ENTER PROJECT_ID: "
read PROJECT_ID
echo


echo _______________________________________________
echo
gsutil ls -p $PROJECT_ID  
echo
echo
gsutil ls -p $PROJECT_ID  | grep proxy

echo _______________________________________________
echo
echo ENTER BUCKET: just the name: no slashes or gs:
read BUCKET


echo _______________________________________________
#gsutil ls -r gs://sre-tf-states/*
gsutil ls -r gs://$BUCKET/*
