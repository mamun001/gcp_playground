
./list_all_projects.sh

echo
echo -n "ENTER PROJECT NAME: "
read PROJECT
echo

gcloud projects describe $PROJECT


