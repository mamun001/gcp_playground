
./set_p.sh



echo ______________________________________________________________________________________________________________
echo
echo list of clusters
echo
gcloud container clusters list | grep -v NAME 
echo
echo _______________________________________________________________________________________________________________
echo
sleep 3

gcloud container clusters list | grep -v NAME | awk '{print $1}' > ./tmp.cluster
gcloud container clusters list | grep -v NAME | awk '{print $1,$2}' > ./tmp.cluster.region
while read c; do
  echo _____________________________________________________________________________________________________________
  echo -n "cluster=$c :"
  REGION=`grep -w $c ./tmp.cluster.region | head -1 | awk '{print $2}'`
  echo "region=$REGION:"
  gcloud container node-pools list --cluster $c --region $REGION |  awk '{print $1}' | grep -v NAME | sort > ./tmp.nodepools
  #cat ./tmp.nodepools
  while read n; do
    echo "$n:"
    gcloud container node-pools describe $n --cluster=$c --region=$REGION | grep -i autoupgrade 
  done <./tmp.nodepools
  echo
  sleep 2
done <./tmp.cluster
echo
sleep 2



exit 0

