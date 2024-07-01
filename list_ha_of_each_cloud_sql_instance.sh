echo
#gcloud config set project arc-eu-primary-cluster
#gcloud config set project foo-preview
#gcloud config set project sre-sandbox-243618
#gcloud config set project foo-concert 
#gcloud config set project nonprod-shared
#gcloud config set project foo-prod-shared 
#gcloud config set project foo-rehersal-universal
#gcloud config set project foo-rehersal


source ./set_p.sh

touch ./tmp.ha
rm ./tmp.ha
touch ./tmp.ha

echo __________________________________________________
echo
echo getting a list
echo
gcloud sql instances list | grep -v NAME | awk '{print $1}' | sort | grep -v replica | grep -v failover > ./tmp.cloudsql
echo
echo

while read p; do
  echo "$p" 
  echo -n "$p" >> ./tmp.ha
  echo -n ": " >> ./tmp.ha
  gcloud sql instances describe $p --format=json | grep -i availabilityType >> ./tmp.ha
done <./tmp.cloudsql

echo
echo ZONAL:
echo
grep -i zonal ./tmp.ha | cut -d: -f1
echo
echo REGIONAL:
echo
grep -i regional ./tmp.ha | cut -d: -f1
echo


