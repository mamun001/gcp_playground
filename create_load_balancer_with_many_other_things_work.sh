

echo ________________________________________________________________________
echo
echo setting account to PERSONAL
echo
sleep 2
#gcloud config set account johndoe@gmail.com
echo
sleep 3

echo ________________________________________________________________________
echo

./switch_SWITCH_betwen_personal_and_gcp_works_both_ways.sh PERSONAL
echo
echo sleeping 10
sleep 10




echo ________________________________________________________________________
echo
echo creating instance-template
echo
sleep 2
gcloud compute instance-templates create foobar-template --machine-type=e2-standard-4 --image-family=debian-10 --image-project=debian-cloud --boot-disk-size=10GB
echo
echo post-check
gcloud compute instance-templates list
echo
sleep 7




echo ________________________________________________________________________
echo
echo Creating instance-group
echo
sleep 2
gcloud compute instance-groups managed create foobar-instancegroup \
    --size 2 \
    --template foobar-template \
    --zone us-central1-a  
echo 
echo post-check
echo
gcloud compute instance-groups list
echo
sleep 7


echo ________________________________________________________________________
echo
echo creating named-port for this instance-group
echo
sleep 3
gcloud compute instance-groups set-named-ports foobar-instancegroup \
    --named-ports http:80 \
    --zone us-central1-a
echo
echo
echo describing instance-group look for named ports
echo
gcloud compute instance-groups describe foobar-instancegroup --zone us-central1-a
echo
sleep 7

echo ________________________________________________________________________
echo
echo creating firewall rule allowing healthcheck
echo
echo works
echo personal account
echo youtubedemo project 3 hard coded
echo
sleep 5

echo starting
echo
sleep 3
gcloud compute firewall-rules create foobar-firewall-rule-allow-healthcheck \
    --network=default \
    --action=allow \
    --direction=ingress \
    --source-ranges=130.211.0.0/22,35.191.0.0/16 \
    --rules=tcp:80 \
    --project=youtube-demo-3-367300
echo
echo
sleep 3
echo post-check
echo 
sleep 3
gcloud compute firewall-rules list
echo
sleep 7


echo _______________________________________________
echo
echo reserving an IP
echo
gcloud compute addresses create foobar-reserved-ip \
    --ip-version=IPV4 \
    --network-tier=PREMIUM \
    --global \
    --project=youtube-demo-3-367300
echo
echo
sleep 3
echo
echo post-check
echo
gcloud compute addresses list
echo
sleep 7

echo _______________________________________________
echo
echo creating a healthcheck
echo
gcloud compute health-checks create http foobar-http-basic-check \
      --port 80 \
      --project=youtube-demo-3-367300
echo
echo 
sleep 5
echo post check
gcloud compute health-checks list
echo
echo
sleep 7


echo _________________________________________________________
echo
echo Create Backend
echo
gcloud compute backend-services create foobar-web-backend-service \
      --load-balancing-scheme=EXTERNAL \
      --protocol=HTTP \
      --port-name=http \
      --health-checks=foobar-http-basic-check \
      --global \
      --project=youtube-demo-3-367300
echo 
echo post-heck
echo
gcloud compute backend-services list
echo
sleep 7


echo __________________________________________________________________________
echo
echo add your instance group as backend to your backend service
echo
gcloud compute backend-services add-backend foobar-web-backend-service \
      --instance-group=foobar-instancegroup \
      --instance-group-zone=us-central1-a \
      --global
echo
echo
echo post-check
echo describe foobar-web-backend-service
echo
sleep 3
gcloud compute backend-services describe foobar-web-backend-service  --global
echo
echo 
sleep 7
  

echo __________________________________________________________________________
echo
echo For HTTP, create a URL map to route the incoming requests to the default backend service
echo
echo
gcloud compute url-maps create foobar-web-map-http \
      --default-service foobar-web-backend-service
echo
echo
echo post-check
echo
gcloud compute url-maps list
echo
echo
sleep 7

  

echo __________________________________________________________________________
echo
echo For HTTPS, create a URL map to route the incoming requests to the default backend service
echo
gcloud compute url-maps create foobar-web-map-https \
      --default-service foobar-web-backend-service
echo
echo
echo post-check
echo
gcloud compute url-maps list
echo
echo
sleep 7

echo __________________________________________________________________________
echo
echo For HTTP, create a target HTTP proxy to route requests to your URL map
echo
gcloud compute target-http-proxies create foobar-http-lb-proxy \
      --url-map=foobar-web-map-http
echo
echo
echo post-check
echo
gcloud compute target-http-proxies list
echo
echo
sleep 7
  
echo __________________________________________________________________________
echo 
echo For HTTP, create a global forwarding rule to route incoming requests to the proxy
gcloud compute forwarding-rules create foobar-http-content-rule \
      --load-balancing-scheme=EXTERNAL \
      --address=foobar-reserved-ip \
      --global \
      --target-http-proxy=foobar-http-lb-proxy \
      --ports=80
echo
echo
echo post-check
echo
gcloud compute forwarding-rules list
echo
echo
sleep 7
  
  

  



echo __________________________________________________________________________
echo
echo Starting CLEAN UP in 15 seconds in reverse order
sleep 15
echo
echo


echo ______
echo forwarding-rules
echo 
gcloud compute forwarding-rules delete foobar-http-content-rule -q
echo
echo
sleep 7



echo ______
echo target-http-proxies
echo
gcloud compute target-http-proxies delete foobar-http-lb-proxy -q
echo
echo
sleep 7

echo ______
gcloud compute url-maps delete foobar-web-map-https  --project=youtube-demo-3-367300 -q
gcloud compute url-maps delete foobar-web-map-http --project=youtube-demo-3-367300 -q
echo
sleep 7

echo _____
echo backend-service
gcloud compute backend-services delete   foobar-web-backend-service --project=youtube-demo-3-367300 --global -q
sleep 7

echo _____
echo health-check
gcloud compute health-checks delete foobar-http-basic-check --project=youtube-demo-3-367300  -q
sleep 7

echo _____
echo IP
gcloud compute addresses delete foobar-reserved-ip --global --project=youtube-demo-3-367300  -q
sleep 7

echo _____
echo fw-rule
gcloud compute firewall-rules delete foobar-firewall-rule-allow-healthcheck  --project=youtube-demo-3-367300  -q
sleep 7

echo _____
echo instancegroup
gcloud compute instance-groups managed delete foobar-instancegroup --project=youtube-demo-3-367300 --zone us-central1-a -q
sleep 7

echo _____
echo instance-template
gcloud compute instance-templates delete foobar-template --project=youtube-demo-3-367300  -q
sleep 7



  



