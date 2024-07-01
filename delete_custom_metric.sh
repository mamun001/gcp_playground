

source set_p.sh
echo
sleep 4


echo
echo
echo creating custom metric
echo
#gcloud beta logging metrics create delete_me_foo  --description="test creating via gcloud"  --config-from-file ./custom_metric_1.json
#gcloud beta logging metrics create delete_me_foo  --config-from-file ./custom_metric_1.json
gcloud beta logging metrics delete terraform_integration_edge_session_duration
gcloud beta logging metrics delete terraform_integration_gw_download_latency
gcloud beta logging metrics delete terraform_integration_channel_mbps_linear.json
