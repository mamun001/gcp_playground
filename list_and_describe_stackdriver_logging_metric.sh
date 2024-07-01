#!/bin/bash 

source set_p.sh

echo _________________________________________________________________________________
echo LIST:
echo
#gcloud logging metrics list | awk '{print $1}' | egrep "edge|gw|mbps"
gcloud logging metrics list --format="table(name)" > ./tmp.metrics
cat ./tmp.metrics
echo

exit 0

echo _________________________________________________________________________________
#worked
echo
echo DESCRIBE
echo
#gcloud logging metrics describe test_upload_mbps_linear --format json
echo
echo


echo _______________________________________________________________________________
echo
echo creating list:
echo
echo test_channel_mbps_linear > ./tmp.metrics
echo test_edge_session_duration >> ./tmp.metrics
echo test_gw_download_latency >> ./tmp.metrics
echo test_gw_roundtrip >> ./tmp.metrics
echo test_gw_upload_latency >> ./tmp.metrics
echo test_upload_mbps_linear >> ./tmp.metrics

#_____
# LOOP, works, creating json file for each
#while read p; do
  #echo "$p"
  #gcloud logging metrics describe $p --format json > ./tmp.metric.$p.json
  #sleep 3
#done <./tmp.metrics



#________________________
# DESCRIBE again
# test_gw_upload_latency has 0.05 width
#gcloud logging metrics describe test_gw_upload_latency --format json 
#gcloud logging metrics describe delete_me_foo_2 --format json 
