
echo ____________________________________________________________________________________________
echo common projects:
echo
echo eu-primary-cluster
echo concert 
echo preview
echo rehersal
echo prod-shared 
echo rehersal-universal 
echo prod-jp-fd
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


#echo _______________________________________________
#echo
#gsutil ls -p $PROJECT_ID  
#echo
#echo
#gsutil ls -p $PROJECT_ID  | grep proxy

echo _______________________________________________
echo
echo ENTER BUCKET: just the name: no slashes or gs:
echo
echo For rehearsal: 996169511903-int-device-proxy
echo For preview: 286003576343-preview-device-proxy
echo For us-concert: 365581414140-device-proxy
echo For eu: prj-1034886846193-device-proxy
echo For jp: prod-jp-device-proxy
echo
read BUCKET
echo

echo _______________________________________________
echo what content of this bucket looks like: 30 samples
gsutil ls -r gs://$BUCKET/* | head -30


echo _______________________________________________
echo "ENTER GUID: e.g.: 45EF0B22-C13D-BD8C-5A43-6EED0DCC6CC6 for jp"
echo "ENTER GUID: e.g.: 2EF8F284-1875-9D5E-B45D-42C281BD9228 for preview"
read GUID
echo


echo _______________________________________________
echo making a dir with GUID and adding a empty file in there
mkdir $GUID
touch $GUID/nullfile
gsutil cp -r $GUID gs://$BUCKET


echo _______________________________________________
echo confirming the addition of the folder with GUID
gsutil ls -r gs://$BUCKET/$GUID/
echo
