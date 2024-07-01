
while read p; do
 echo _______________________________________________________________________________________________________
 echo $p
 sleep 3
 gcloud projects get-iam-policy $p --format='json(bindings)' | wc -l
 sleep 3
done < ./list_of_all_projects.data

