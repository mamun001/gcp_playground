
source set_p.sh

gcloud config list | grep project
echo
echo
sleep 2

echo ________________________________________________________________
echo
echo getting a list of SQL instances
echo
gcloud sql instances list | awk '{print $1}' | grep -v NAME | grep -v failover| sort > ./j1
echo
echo list of SQL Instances:
echo
cat ./j1
echo


while read p; do
  echo ________________________________________________________________
  echo "$p"
  gcloud sql databases list --instance=$p | grep -v NAME | grep -v postgres | grep -v mysql | grep -v sys | grep -v performance | grep -v information | awk '{print $1}'
done <./j1

exit 0

