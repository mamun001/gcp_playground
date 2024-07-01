
#  PROJECT="sandbox"
   #PROJECT="production"
   #PROJECT="stage"
   #PROJECT="development"


cat /dev/null > ./tmp.ips
echo doing pre-work
for PROJECT in sandbox production production stage development businessintelligence infrastructure prj-bi-d-platform-data ; do
  gcloud config set project $PROJECT
  gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n >> ./tmp.ips
done 

echo
echo -n "ENTER THE IP YOU WANT THE GCE VM NAME FOR: "
read IP
grep $IP ./tmp.ips


exit 0

gcloud config set project production
gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n
echo
echo
sleep 5
gcloud config set project sandbox
gcloud --format="value(name,networkInterfaces[0].accessConfigs[0].natIP)" compute instances list | sort -n | uniq | sort -n
