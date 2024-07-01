#!/bin/bash


##  There is a BUG, if monitoring is disabled , it shows lgeacy but is not
##  2 shard clusters have this problem
##
echo "PROJECT,CLUSTER,MONITORING" > ./all.csv

while read p; do
  echo ______________________________________________________________________________________________________________
  gcloud config set project $p
  export PROJECT=$p
  echo CONFIRMING:
  gcloud config list | grep project
  echo PROJECT=$PROJECT
  #sleep 2

  echo ______________________________________________________________________________________________________________
  echo
  echo list of clusters in $PROJECT
  echo
  gcloud container clusters list | grep -v NAME 
  echo
  echo _______________________________________________________________________________________________________________
  echo
  #sleep 1

  gcloud container clusters list | grep -v NAME | awk '{print $1}' > ./tmp.cluster
  gcloud container clusters list | grep -v NAME | awk '{print $1,$2}' > ./tmp.cluster.region
  while read c; do
    echo _____________________________________________________________________________________________________________
    echo
    REGION=`grep -w $c ./tmp.cluster.region | head -1 | awk '{print $2}'`
    echo
    MON=`gcloud container clusters describe $c --region=$REGION  | grep monitoringService`
    echo MON=$MON
    ##  monitoringService: monitoring.googleapis.com/kubernetes
    if [[ $MON =~ "kubernetes" ]]; then
      echo "$PROJECT,$c,GKE" >> ./all.csv
    else
      echo "$PROJECT,$c,LEGACY" >> ./all.csv
    fi
    tail -1 ./all.csv
    #sleep 3
    echo
    #sleep 1
  done <./tmp.cluster
  echo
done <./list_of_all_projects.data 

exit 0


