
echo
echo There is different script for doing the same for GCE VMs
echo
sleep 5

echo
echo tmp.projects must have the list of projects:
echo
sleep 5

echo
echo
cat ./tmp.projects
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



while read p; do
  echo ______________________________________________________________________________________________________
  echo "$p"
  #gcloud compute addresses list --project  $p 
  gcloud compute forwarding-rules list --project $p | grep $IP_PART
  echo
  #sleep 5
done <./tmp.projects


#35.190


exit 0


