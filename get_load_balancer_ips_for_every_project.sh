

echo
echo tmp.projects must have the list of projects:
echo
sleep 5

echo
echo
cat ./tmp.projects
echo
sleep 5

while read p; do
  echo ______________________________________________________________________________________________________
  echo "$p"
  echo
  sleep 1
  #gcloud compute addresses list --project  $p 
  gcloud compute forwarding-rules list --project $p
  echo
  sleep 5
done <./tmp.projects


#35.190


exit 0


