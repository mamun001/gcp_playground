

echo 
echo ENTER KEYWORD
read KW


echo ______________________________________________________________________________________________________
echo
echo projects list:
echo
gcloud projects list | sort  | grep $KW | grep -v ten | grep -v tnt
#gcloud projects list | sort  | grep -v ten | grep -v tnt
echo
sleep 2


exit 0


