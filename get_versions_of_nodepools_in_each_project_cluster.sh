#!/bin/bash

echo "PROJECT,CLUSTER,NODEPOOL,ATTR:VALUE" > ./all.csv

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
    gcloud container node-pools list --cluster $c --region $REGION |  awk '{print $1}' | grep -v NAME | sort > ./tmp.nodepools
    #sleep 1
    while read n; do
      echo
      echo
      gcloud container node-pools describe $n --cluster=$c --region=$REGION --format=flattened | grep version > ./tmp.tmp
      sed -i -e "s/^/$PROJECT,$c,$n,/" ./tmp.tmp
      cat tmp.tmp
      cat ./tmp.tmp >> ./all.csv
      echo
    done <./tmp.nodepools
    echo
    #sleep 1
  done <./tmp.cluster
  echo
done <./list_of_all_projects.data

exit 0


