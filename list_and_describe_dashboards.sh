

source ./set_p.sh
echo



# works
#gcloud beta monitoring dashboards list --project=squad-super-heroes-dev  | grep -i displayname | sort
#gcloud beta monitoring dashboards list --project=squad-super-heroes-dev | grep -i metric | egrep -i  "ku|k8"


#gcloud beta monitoring dashboards list --project=squad-super-heroes-dev > j1
gcloud beta monitoring dashboards list


