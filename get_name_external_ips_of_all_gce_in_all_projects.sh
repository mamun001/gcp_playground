
#  PROJECT="sandbox"
   #PROJECT="production"


for PROJECT in sandbox production development businessintelligence infrastructure ; do
  gcloud config set project $PROJECT
  #gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n
  gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | wc -l
  echo
  echo
done 




