

echo
echo ENTER PART OF THE IP: e.g. 94.225
read IP

#  making a list of projects
grep -v backup2 list_of_all_projects.data | grep -v foo.design | grep -v client.nonprod  > ./tmp.projects
echo
echo
sleep 3




while read p; do
  echo ______________________________________________________________________________________________________
  echo "$p"
  gcloud compute addresses list --project  $p  | grep $IP
  #gcloud compute addresses list --project  $p  | egrep "ing|fan"
  echo
done <./tmp.projects



